# RDM data issue
## Current situation
Since the operational start of the "Delete and Archive" process (end of 2021) in eLOK following data issue occurs:
### Situation in Siebel
The processing of a S_LOY_TXN item leads to its deletion after archiving - but the subsequent deletion and archiving of related S_LOY_RDM_ITM items (joined via TXN_ID) does not happen. Instead of deleting the S_LOY_RDM_ITM only the TXN_ID is set to NULL and thus the record
- loses all relations to the loyalty world - the record is orphaned for the loyalty program and is not visible on the GUI anymore
- will never be found by any subsequent housekeeping jobs
- loses its indicators for the ARCHIVING-attributes RETENTION_END_DT  
### Situation in OLAP
Together with L+A in OLTP there was introduced a DELETE_FLG on WC_LOY_TXN_F and WC_BB_POINTS_F/WC_BC_POINTS_F (derived from S_LOY_ACRL_ITM and S_LOY_RDM_ITM) - which checked for delete messages (in S_ETL_D_IMG_Cx via DELETE trigger in SIEBEL) and would flag deleted items accordingly without changing the original payload. But as the aforementioned OLTP behavior led to regular UPDATE messages (which would erase the relation from bb-/bc-points to their head transaction in OLAP) we implemented a "maintain existing TXN_WID relation" rule in ETL (SIL stage).
Unluckily this preemptive action was not sufficient to avoid data loss due to two following issues:
a) The delivered TXN_ID was used in processing the UPDATE messages to lookup the according ROW_WIDs for the attached products and actions - and these were not protected from data loss as the TXN_WID was 
b) Assumption "TXN of redemption is always present in BEFORE resulting accrual/redemption is processed" is wrong
i) An until recently undetected data issue in the ETL change capture process led to severe data information loss also: the lookup for products and other attributes in points relies on the existence of the linked transaction in DWH before the accrual/redemption is processed. This is ensured (or better: was logically thougt to be failsafe) by processing dependencies in the DAC tasks - which relied on the standard change capture process build on the database attributes LAST_UPD in the source tables. But (only on production) a redemption creating process starts parallel (or short after) to the daily etl - and leads to the situation that the redemptions are take by ETL run X - and their corresponding transactions are excluded and tranferred in the next ETL run X+1 (though they have an identical CREATED date and logically should be found by CHANGE_CAPTURE - but there seem to be yet other influencing factors (different transaction brackets for different tables, .. ?)). 
ii) Not all redemptions in OLTP have a TXN_ID. For these items TXN-dependent attributes cannot be calculated.

## Necessary Improvements
### Siebel OLTP
1. The issue of "non-deletion" will be fixed with ELOKSBL-xxxxx
2. The issue of "txn-free redemptions" is not analyzed yet
### DWH OLAP
1. The points processing mapping must
a) protect every TXN_WID depending attribut against NULLing
b) keep the original TXN_ID for retries in case not yet available TXNs
2. A post-processing step for yet unresolved TXN_IDs from previous ETLs must be established to make the ETL more resilient

## Data issues, (possible) data corrections and their limits 
### 1 OTLP: Archive tables
Referential integrity of transactions, accruals and redemptions should be given in archive also.
If archiving of transactions starts without their adjoined redemptions, data integrity in the archive is not given.
And for redemptions without TXN_ID no rules for calculating RETENTION_END_DT exist.
### 2 OTLP: Undeleted redemptions in SIEBEL.S_LOY_RDM_ITM
Indicator for "undeleted" redemptions: TXN_ID is NULL and set ACCRUAL_ITEM_ID is orphaned.
BEFORE deleting a record following issues must be fixed/considered
Possible data sources to refind the "correct" TXN_ID
- TYPE_CD "Verfall": find the TXN_ID of deleted ACC in DA tables - this process sets identical ID
- TYPE_CD <> "Verfall": cannot be derived directly from DA tables
  - WC_LOY_TXN_F.INTEGRATION_ID from olap.WC_BB_POINTS_F/WC_BC_POINTS_F.TXN_WID (if still exists due to protective actions)  
  - perhaps (needs much more research: match person transaction in archive via DELETE date against orphaned person redemption and try to map sums )
  When DELETING after adding necessary information for ARCHIVE (or direct deletion if derived retention rule negates archive need ): make sure that the data amount DOES NOT have severe impact on ETL (probably a joined OLTP-OLAP mig package is the best choice)
### 3 OTLP: purposely TXN-free redemptions
- define L+A rules
- define DWH processing rules for TXN-dependent attributes
### 4 OLAP: TXN_WID set, PROD_WID, ... =0
Easy data correction: derive missing WIDs from transaction wid.

### 5 OLAP: TXN_WID = 0
Get TXN_ID from existing itm in SIEBEL (if exists - take it, if not take ID from 2, if not - no correction possible) and set depending attributes accordingly ( - set DELETE_FLG also?)