let $info := (
     (:doc("xml_docs/B4DA$$.xml"),  
     doc("xml_docs/1999.xml") ,
     doc("xml_docs/SummerKnights.xml") ,:) 
     doc("./xml_docs/Rejex.xml"))
let $rhymeStrings := $info//group[@rhyme]/@rhyme/string()
for $rhymeString in $rhymeStrings
let $rhymeCount := count(tokenize($rhymeString, " " )) + 1
(:for $count in $assimilation count(&nbsp;) + 2:)
return ($rhymeString, "&#10;")