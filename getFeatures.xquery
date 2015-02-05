let $info := (
     doc("B4DA$$.xml") ,
     doc("1999-markup.xml") ,
     doc("Summer Knights.xml") ,
     doc("Rejex.xml")
)
let $features := distinct-values($info//stanza/@artist[./string() != ''])
for $feature in $features
order by $feature
return concat('"', $feature, '" | ')