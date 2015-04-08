let $info := (
     (:doc("xml_docs/B4DA$$.xml") ,:)
     doc("xml_docs/1999.xml") ,
     doc("xml_docs/SummerKnights.xml") ,
     doc("xml_docs/Rejex.xml")
)
(:let $motifs := distinct-values($info//li/*/name()[not(.='AAVE')][not(.='group')][not(.='compound')])
for $motif in $motifs
order by $motif
return $info//*[name()=$motif]:)

(:$info//*[name()=$motif]

unless I'm mistaken, @artist is going to be replaced with 
 an attribute @speaker. Updated to fit that. (If I was mistaken,
 can fix quickly)
:)

(:let $refArtists := distinct-values($info//li/hiphop/@ref)
for $refArtist in $refArtists
order by $refArtist
return ($refArtist, '&#10;'):)

(:The purpose of this xQuery is to find all artists that are referenced in the corpus.
Joey and the featured artists on his projects utilize a wide variety of references to other figures in hip hop, 
and the results of this query will be used to create a social network graph in cytoscape that will trace the variety and frequency of these references.:)

(:let $refGeos := distinct-values($info//li//geo/@ref)
for $refGeo in $refGeos
order by $refGeo
return ($refGeo, '&#10;')
:)

(:The purpose of this xQuery is to find all geographic locations that are referenced in the corpus. 
Joey and the featured artists refer to geographic locations across the world (primarily in New York); 
the results of this query will be used to create a graph of some sort (perhaps in cytoscape) that traces the variety and frequency of these references. 
Then, it may be interesting to see these locations plotted on a world map!:)
