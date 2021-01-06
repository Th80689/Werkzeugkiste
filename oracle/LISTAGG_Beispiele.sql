with base as (
select level as bytecode 
     , chr(level) output--, length(chr(level)) , asciistr(level), unistr(level) as unicode_out
     , case when regexp_instr(chr(level), '[[:digit:]]')>0 then 'X' else NULL end ZAHL 
     , case when regexp_instr(chr(level), '[[:alpha:]]')>0 then 'X' else NULL end BUCHSTABE
     , case when regexp_instr(chr(level), '\s')>0 then 'X' else NULL end WHITESPACE
     , case when (regexp_instr(chr(level), '[!"#<=>$%&\()*+,-./:;?@^_`[~{}|]') > 0 
            or chr(level) in ('[', ']')
            or level = 39 -- '
            ) then 'X' else NULL 
     end SONDERZEICHEN
     , case
       when level=8 then 'backspace'
       when level=9 then 'horizontal Tab'
       when level=10 then 'NL new line, line feed'
       when level=13 then 'CR carriage return'
       when level=32 then 'space'
     end KOMMENTARE
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
     , Kommentare
     , LISTAGG( BYTECODE
              , '|' -- Attribut [, <SEPARATOR> ]
                 ON OVERFLOW TRUNCATE '...') -- [ ON OVERFLOW TRUNCATE '<Substitug bei zu vielen Einträgen>]
   WITHIN GROUP (ORDER BY BYTECODE) -- Sortierung innerhalb der Liste
   OVER (PARTITION BY OUTPUT) as "erzeugt mit CHR(x)"  -- Gruppierungskennzeichen für Listen-Einträge
  from base
 where 1=1
 --  and (ZAHL is NOT NULL OR buchstabe is NOT NULL OR WHITESPACE is NOT NULL OR SONDERZEICHEN is NOT NULL
   and length(output) > 0
 --  and bytecode between 123 and  130
ORDER BY 6