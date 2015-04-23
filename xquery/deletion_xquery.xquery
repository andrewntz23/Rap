let $info := (
     doc("../xml/B4DA$$.xml"),  
     doc("../xml/1999.xml"),
     doc("../xml/SummerKnights.xml") , 
     doc("../xml/Rejex.xml")
     
     )
let $AAVE := $info//li/AAVE
let $Ccount := count($AAVE[@class='copula'])
let $Acount := count($AAVE[@class='auxiliary'])
let $Tcount := count($AAVE[@class='to'])
let $Pcount := count($AAVE[@class='preposition'])
return 
<table>
    <tr>
    <th>Copula</th>
    <th>Auxiliary</th>
    <th>To</th>
    <th>Object</th>
    <th>Preposition</th>
    </tr>
    <tr> 
    <th>{$Ccount}</th>
    <th>{$Acount}</th>
    <th>{$Tcount}</th>
    <th>{$Pcount}</th>
    </tr>
</table>

