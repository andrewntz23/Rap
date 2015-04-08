let $info := (
     doc("xml/B4DA$$.xml") ,
     doc("xml/1999.xml") ,
     doc("xml/SummerKnights.xml") ,
     doc("xml/Rejex.xml")
)
let $motifs := distinct-values($info//li/*/name()[not(.='AAVE')][not(.='group')][not(.='compound')])
for $motif in $motifs
order by $motif
return $info//*[name()=$motif]

(:$info//*[name()=$motif]

unless I'm mistaken, @artist is going to be replaced with 
 an attribute @speaker. Updated to fit that. (If I was mistaken,
 can fix quickly)
:)