declare function local:order-value ($rhymeStrings as xs:string*)
    as xs:integer* {
    let $rhymeSeq := ()
    for $rhymeString in $rhymeStrings
    let $rhymeCount := count(tokenize($rhymeString, " " )) +1
    let $rhymeSeq := insert-before($rhymeSeq, 1, $rhymeCount)
    return $rhymeSeq
};

(:Needs to take one sequence which is the sums and just add that.:)
declare function local:get-numGroups($sums as xs:double*, $distinctValues as xs:integer*)
    as xs:double* {
    
    let $returnSeq := ()
    let $counter := count($sums)
    for $i in (1 to $counter)
    let $thisSum := $sums[$i]
    let $thisValue := $distinctValues[$i]
    let $returnSeq := insert-before($returnSeq, 1, ($thisSum div $thisValue))
    return $returnSeq
    };

declare function local:get-counts($list as xs:integer*, $distinctValues as xs:integer*)
as xs:integer* {
    let $returnSeq := ()
    for $distinctValue in $distinctValues
    let $count := count(index-of($list, $distinctValue))
    let $returnSeq := insert-before($returnSeq, 1, $count)
    return $returnSeq

};

(:Main Function:)

let $info := (
     doc("./xml/B4DA$$.xml")  
     (:doc("xml/1999.xml") ,
     doc("xml/SummerKnights.xml") , 
     doc("./xml/Rejex.xml")):)
     
     )
     
    let $mySeq := $info//group[@rhyme]/@rhyme/string()

    let $list := local:order-value($mySeq)  (:  $list is the sequence of counts for each group  :)
    
    let $distinctValues := distinct-values($list)
    let $counts := local:get-counts($list, $distinctValues)  
    let $sumCounts := sum($counts)
    let $numGroups := sum(local:get-numGroups($counts, $distinctValues))
    (:return (
    '&#10;',
        'value: ', $distinctValues,
        '&#10;',
        'sums: ', $counts,
        '&#10;',
        'overall sum: ', $sumCounts,
        '&#10;',
        'numGroups: ', $numGroups,
        '&#10;',
        $sumCounts div $numGroups
    
    
    ):)
    return count(index-of($list, 2))
     
(:let $rhymeStrings := $info//group[@rhyme]/@rhyme/string()
for $rhymeString in $rhymeStrings
let $rhymeCount := count(tokenize($rhymeString, " " )) + 1
(\:for $count in $assimilation count(&nbsp;) + 2:\)
return ($rhymeString, "&#10;"):)