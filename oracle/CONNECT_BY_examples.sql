/*
CONNECT_BY_examples.sql

*/

-- Eine Liste von mit der Stunden in zwischen zwei Tagen
-- muss als Skript ausgeführt werden!

var sDate varchar2(10);
var endDate varchar2(10);

exec :sDate := '01-01-2020';
exec :endDate := '02-01-2020';


select level, to_char(to_date( :sDate,'dd-mm-yyyy' ) + level/24, 'dd-mm-yyyy hh24:mi') dt
from   dual
connect by level <= ( 24 + ( 24 * 
    ( to_date(:endDate,'dd-mm-yyyy hh24') - 
        to_date(:sDate,'dd-mm-yyyy hh24') )
  ) 
) ;

--===============================
-- Hierarchie-Abfrage
--===============================
with base as (
select level as ID
  from dual 
connect by level <25
)
, hier as ( select ID as EMPLOYEE_ID
    , 'Employee ' || ID as name
    , case when ID < 5 then 1 when ID in (11,15) then 7 else mod(ID, 4) end MANAGER_ID
  from base
  )
-- Query auf Beispiel-Tabelle
select level
     , level -1 as "Länge Pfad"
     , t.employee_id
     , t.name as "Employee" -- NODE-Name
     , CONNECT_BY_ROOT(t.name) as "Ursprung" -- ROOT-Name
     , decode(CONNECT_BY_ISLEAF, 0, 'Nein', 1, 'Ja') as "Endpunkt"
     , CONNECT_BY_ISCYCLE as "Selbstreferenz"
     , t.manager_id 
     , SYS_CONNECT_BY_PATH(t.name, '/') as "Path" -- alle Werte von ROOT bis NODE
  from hier t
 where 1=1
   START WITH name='Employee 3' -- Einstiegpunkt in die Hierarchie
   CONNECT BY NOCYCLE --  avoid ORA-01436 - Endlosschleife durch Selbstreferenz
     PRIOR employee_id = manager_id -- Verbindungskennzeichen
order by level, SYS_CONNECT_BY_PATH(t.name, '/')
; 
