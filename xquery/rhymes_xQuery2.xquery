(:Get a sequence of group size counts by counting tokenize on whitespace for attribute
values:)
declare function local:order-value ($rhymeStrings as xs:string*)
    as xs:integer* {
    let $rhymeSeq := ()
    for $rhymeString in $rhymeStrings
    let $rhymeCount := count(tokenize($rhymeString, " " )) +1
    let $rhymeSeq := insert-before($rhymeSeq, 1, $rhymeCount)
    return $rhymeSeq
};

(:Take a sequence of sums and a sequence of values and return a sequence of 
  the number of groups of that value, all in order.
:)
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
(:Get the count of how many times a given value appears:)
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
     doc("../xml/B4DA$$.xml"),  
     doc("../xml/1999.xml"),
     doc("../xml/SummerKnights.xml") , 
     doc("../xml/Rejex.xml")
     
     )
    for $song in $info 
(:  Change @rhyme to @theDesiredDevice to get different info :)
    let $mySeq := $song//group[@assimilation]/@assimilation/string()
    let $list := local:order-value($mySeq)  (:  $list is the sequence of counts for each group  :)
    let $distinctValues := distinct-values($list)
    let $counts := local:get-counts($list, $distinctValues)  
    let $sumCounts := sum($counts)
    let $numGroups := sum(local:get-numGroups($counts, $distinctValues))
    return (
        '&#10;', 
        $song//albumTitle/string(),
        '&#10;',
        'value: ', $distinctValues,
        '&#10;',
        'sums: ', $counts,
        '&#10;',
        'overall sum: ', $sumCounts,
        '&#10;',
        'numGroups: ', $numGroups,
        '&#10;',
        'average: ', $sumCounts div $numGroups   
    )
     