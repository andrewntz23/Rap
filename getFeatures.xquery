let $info := (
     doc("B4DA$$.xml") ,
     doc("1999-markup.xml") ,
     doc("Summer Knights.xml") ,
     doc("Rejex.xml")
)
let $speakers := distinct-values($info//stanza/@speaker[./string() != ''])
for $speaker in $speakers
order by $speaker
return concat('"', $speaker, '" | ')

(:unless I'm mistaken, @artist is going to be replaced with 
 an attribute @speaker. Updated to fit that. (If I was mistaken,
 can fix quickly)
:)