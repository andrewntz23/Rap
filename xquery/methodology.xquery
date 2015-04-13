let $doc := 
doc(methodology.xhtml)
let $h4 := $doc//h4 
for $thinginh4 in $h4
let $id := $thinginh4/@id
let $p := $thinginh4/following-sibling::*[1]
return 
($id, $p)