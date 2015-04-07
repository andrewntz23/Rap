
(:Main logic: for any given group tag, get its attributes. Follow its pointers
by tokenizing the attribute value, and for each pointer, going to the group whose @num
is equal to that pointer. Then check the attribute value: if it contains the original number,
we're good, if not, return the error message:)


declare function local:validate($group as element(group))
as xs:boolean* {
    let $boolean := 0
    let $thisNum := $group/@num
    let $thisGroup := $group/@label
    let $numAttributes := count($group/@*)
    let $attributeNames := ()
    let $attributeValues :=  ()
    for $i in (1 to $numAttributes)
    let $attributeNames :=  insert-before($attributeNames, 1, name($group/@*[$i]))
    let $attributeValues := insert-before($attributeValues, 1, $group/@*[$i])
(:  so I have the values and the names; need to for  :)
    for $i in (1 to count($attributeValues))
    let $attribute := $attributeNames[$i]
    let $values := $attributeValues[$i]
    let $valid := local:check-others($group, $attribute, $values)
    return $valid
(:    return ($thisNum, $attributeNames, $attributeValues)
:)};
(:Need to remove @num first off. :)
declare function local:check-others($group as element(group), $attribute as xs:string, $attributeValues as xs:string)
as xs:boolean{
    let $thisNum := $group/@num
    let $thisGroup := $group/@label
    let $values := tokenize($attributeValues, '\s+')
    for $value in $values
    let $otherGroupTag := $group/ancestor::stanza//group[@num = $value]
(:  Can't do contain on multiple; pass this to another function?  :)
    return contains($otherGroupTag/@*[name(.)=$attribute], $thisNum)
};

let $info := (
     doc("./xml/B4DA$$.xml") 
     (:doc("./xml/1999.xml"),
     doc("./xml/SummerKnights.xml") , 
     doc("./xml/Rejex.xml"):)
     
     )
(:  Change @rhyme to @theDesiredDevice to get different info :)
    let $groups := (($info//song)[1]//group)[1]
    for $group in $groups
    let $valid := local:validate($group)
    (:return
    if ($valid = 1)
    then  '&#10;'
    else  'error message &#10;':)
    return $valid