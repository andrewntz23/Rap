let $info := (
     (:doc("xml_docs/B4DA$$.xml"),  :) 
     doc("xml_docs/1999.xml") ,
     doc("xml_docs/SummerKnights.xml") ,
     doc("xml_docs/Rejex.xml"))
let $assimilation := $info//group[@assimilation]
for $count in $assimilation count(&nbsp;) + 2
return a thing