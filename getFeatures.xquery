let $info := (
     doc("xml_docs/B4DA$$.xml") ,
     doc("xml_docs/1999.xml") ,
     doc("xml_docs/SummerKnights.xml") ,
     doc("xml_docs/Rejex.xml")
)
let $speakers := distinct-values($info//stanza/@speaker[./string() != ''])
for $speaker in $speakers
order by $speaker
return concat('"', $speaker, '" | ')

(:unless I'm mistaken, @artist is going to be replaced with 
 an attribute @speaker. Updated to fit that. (If I was mistaken,
 can fix quickly)
:)