let $info := (
     doc("../xml/1999.xml"),
     doc("../xml/B4DA$$.xml"),
     doc("../xml/SummerKnights.xml"), 
     doc("../xml/Rejex.xml")
     )
let $AAVE := $info//li/AAVE
let $a := $AAVE[@type = 'contraction']
return 
<div>
<table border="1">
    <tr>
        <th>Word 1</th>
        <th>Count</th>
    </tr>
    {for $adist in distinct-values($a/@word1)
    let $acount := count($a[@word1 eq $adist])
    order by $acount descending
    return
    <tr>
        <td>{$adist}</td>
        <td>{$acount}</td>
    </tr>}
</table>
<table border="1">
    <tr>
        <th>Word 2</th>
        <th>Count</th>
    </tr>
    {for $bdist in distinct-values($a/@word2)
    let $bcount := count($a[@word2 eq $bdist])
    order by $bcount descending
    return
    <tr>
        <td>{$bdist}</td>
        <td>{$bcount}</td>
    </tr>}
</table>
<table border="1">
    <tr>
        <th>Word 3</th>
        <th>Count</th>
    </tr>
    {for $cdist in distinct-values($a/@word3)
    let $ccount := count($a[@word3 eq $cdist])
    order by $ccount descending
    return
    <tr>
        <td>{$cdist}</td>
        <td>{$ccount}</td>
    </tr>}
</table>
</div>


