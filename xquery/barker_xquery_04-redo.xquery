let $info := (
     doc("xml/B4DA$$.xml") 
     (:doc("xml/1999.xml") ,
     doc("xml/SummerKnights.xml") ,
     doc("xml/Rejex.xml"):)
)

(:let $line := $info//li 
let $multOccurStrSuc := $info//li/struggle/following-sibling::success
return $multOccurStrSuc:)

(:let $line := $info//li 
let $multOccurViGun := $info//li/violence/following-sibling::guns
return $multOccurViGun:)

(:let $line := $info//li 
let $multOccurWoSex := $info//li/women/following-sibling::sex
return $multOccurWoSex:)

let $line := $info//li 
let $multOccurSporFash := $info//li/sports/child::fashion
return $multOccurSporFash 

(: For the first three XQuerys, I was looking for cooccurences within the same line across Joey's corpus, these tags, I hypothesized, seemed to fit together in terms of 
them being associated with one another and so I wanted to see where they were occurring within the songs. For the last XQuery, since Joey tends to combine sports and fashion 
references, basketball players' jerseys, athlete's sneakers, etc., I wanted to find the instances in which fashion was tagged within a sports reference. :)