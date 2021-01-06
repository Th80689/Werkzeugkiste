with base as (
select level as bytecode 
     , chr(level) output--, length(chr(level)) , asciistr(level), unistr(level) as unicode_out
     , case when regexp_instr(chr(level), '[[:digit:]]')>0 then 'X' else NULL end ZAHL 
     , case when regexp_instr(chr(level), '[[:alpha:]]')>0 then 'X' else NULL end BUCHSTABE
     , case when regexp_instr(chr(level), '\s')>0 then 'X' else NULL end WHITESPACE
     , case when (regexp_instr(chr(level), '[!"#<=>$%&\()*+,-./:;?@^_`[~{}|]') > 0 
            or chr(level) in ('[', ']')
            or level = 39 -- '
            ) then 'X' else NULL end SONDERZEICHEN
  from dual 
 where chr(level) is not null -- Anzeige
connect by level < 256
)
select distinct  output
, length(output)
     , ZAHL
     , BUCHSTABE
     , SONDERZEICHEN
     , WHITESPACE
     , LISTAGG( BYTECODE
              , '|' -- Attribut [, <SEPARATOR> ]
                 ON OVERFLOW TRUNCATE '...') -- [ ON OVERFLOW TRUNCATE '<Substitug bei zu vielen Einträgen>]
   WITHIN GROUP (ORDER BY BYTECODE) -- Sortierung innerhalb der Liste
   OVER (PARTITION BY OUTPUT) as "erzeugt mit CHR(x)"  -- Gruppierungskennzeichen für Listen-Einträge
  from base
 where ZAHL is null and buchstabe is null and WHITESPACE is null and SONDERZEICHEN is null
   and length(output) > 0
 --  and bytecode between 123 and  130
ORDER BY 6