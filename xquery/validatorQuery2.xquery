
declare function local:get-attributeNames($group as element(group))
as xs:string*{
    let $attributeNames := ()
    let $attributeCount := count($group/@*)
    for $i in (3 to $attributeCount)
    let $attributeNames :=  insert-before($attributeNames, 1, name($group/@*[$i]))
    return $attributeNames
};


declare function local:get-attributeValues($group as element(group))
as xs:string*{
    let $attributeValues:= ()
    let $attributeCount := count($group/@*)
    for $i in (3 to $attributeCount)
    let $attributeValues := insert-before($attributeValues, 1, $group/@*[$i])
    return $attributeValues
};

(:So I get here; I have this group and access to all of its info, and to one attribute name and one attribute value
What I want to do is find any and all groups that this points to, and ensure that they also point back here. If so, return null;
if not, return those groups. :)
declare function local:check-attributes($group as element(group), $attributeName as xs:string, $attributeValues as xs:string)
as element(group)* {
    let $valuesToCheck := tokenize($attributeValues, "\s")
    let $ourNum := $group/@num
    for $valueToCheck in $valuesToCheck
    let $otherGroups := $group/ancestor::stanza//group[@label=$group/@label][@num = $valueToCheck]
(:  Here simply add in the thing to make sure that their @attributeThatWeCareAbout contains $ourNum  :)
    for $otherGroup in $otherGroups
    return 
        if (not(contains($otherGroup/@*[name()=$attributeName], $ourNum)))
            then ($group, $otherGroup)
        else ()

};

let $info := (
     (:doc("../xml/B4DA$$.xml"):) 
     doc("../xml/1999.xml"),
     doc("../xml/SummerKnights.xml") , 
     doc("../xml/Rejex.xml")
     
     )
     
    let $groups := (($info//song)//group)
    for $group in $groups
    let $attributeNames := local:get-attributeNames($group)
    let $attributeValues := local:get-attributeValues($group)
    let $attributeCount := count($attributeNames) 
    for $i in (1 to $attributeCount)
    let $valid := local:check-attributes($group, $attributeNames[$i], $attributeValues[$i])
    return ($valid)