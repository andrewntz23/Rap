let $info := (
     (:doc("xml/B4DA$$.xml"),  
     doc("xml/1999.xml") ,
     doc("xml/SummerKnights.xml") ,:) 
     doc("./xml/Rejex.xml"))
let $rhymeStrings := $info//group[@rhyme]/@rhyme/string()
for $rhymeString in $rhymeStrings
let $rhymeCount := count(tokenize($rhymeString, " " )) + 1
(:for $count in $assimilation count(&nbsp;) + 2:)
return ($rhymeString, "&#10;")