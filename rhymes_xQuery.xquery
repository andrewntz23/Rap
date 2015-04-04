declare function local:order-value ($rhymeStrings as xs:string*)
    as xs:integer* {
    let $rhymeSeq := ()
    for $rhymeString in $rhymeStrings
    let $rhymeCount := count(tokenize($rhymeString, " " )) +1
    let $rhymeSeq := insert-before($rhymeSeq, 1, $rhymeCount)
    return $rhymeSeq
};

let $info := (
     (:doc("xml/B4DA$$.xml"),  
     doc("xml/1999.xml") ,
     doc("xml/SummerKnights.xml") ,:) 
     doc("./xml/Rejex.xml"))
     
    let $mySeq := $info//group[@rhyme]/@rhyme/string()
    let $list := local:order-value($mySeq)
    
    let $distinctValues := distinct-values($list)
    
    let $totalSum := 0
    let $totalGroups := 0
   for $distinctValue in $distinctValues
   let $count := count(index-of($list, $distinctValue))
   let $totalSum := $totalSum + $count
   let $groups := $count div $distinctValue
    return $groups
     
(:let $rhymeStrings := $info//group[@rhyme]/@rhyme/string()
for $rhymeString in $rhymeStrings
let $rhymeCount := count(tokenize($rhymeString, " " )) + 1
(\:for $count in $assimilation count(&nbsp;) + 2:\)
return ($rhymeString, "&#10;"):)