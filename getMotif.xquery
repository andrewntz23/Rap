let $info := (
     doc("xml_docs/B4DA$$.xml") ,
     doc("xml_docs/1999.xml") ,
     doc("xml_docs/SummerKnights.xml") ,
     doc("xml_docs/Rejex.xml")
)
let $motifs := distinct-values($info//li/*/name()[not(.='AAVE')][not(.='group')])
for $motif in $motifs
order by $motif
return $motif, "SPLIT"

(:$info/*[1][name()=$motif]

unless I'm mistaken, @artist is going to be replaced with 
 an attribute @speaker. Updated to fit that. (If I was mistaken,
 can fix quickly)
:)