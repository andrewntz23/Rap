declare namespace functx = "http://www.functx.com";
declare function functx:add-attributes
  ( $elements as element()* ,
    $attrNames as xs:QName* ,
    $attrValues as xs:anyAtomicType* )  as element()? {

   for $element in $elements
   return element { node-name($element)}
                  { for $attrName at $seq in $attrNames
                    return if ($element/@*[node-name(.) = $attrName])
                           then ()
                           else attribute {$attrName}
                                          {$attrValues[$seq]},
                    $element/@*,
                    $element/node() }
 } ;

let $doc := 
doc("../xml/xml mock up for xquery.xml")
let $h4 := $doc//h4 
for $thinginh4 in $h4
let $id := $thinginh4/@id
let $p := $thinginh4/following-sibling::*[1]
return functx:add-attributes($p, xs:QName('id'), $id)
