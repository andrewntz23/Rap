let $info := (
     doc("xml/B4DA$$.xml") ,
     doc("xml/1999.xml") ,
     doc("xml/SummerKnights.xml") ,
     doc("xml/Rejex.xml")
)
let $speakers := distinct-values($info//stanza/@speaker[./string() != ''])
for $speaker in $speakers
order by $speaker
return concat('"', $speaker, '" | ')

(:unless I'm mistaken, @artist is going to be replaced with 
 an attribute @speaker. Updated to fit that. (If I was mistaken,
 can fix quickly)
:)