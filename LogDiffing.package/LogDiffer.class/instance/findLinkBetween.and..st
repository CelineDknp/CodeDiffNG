compute
findLinkBetween: nodeFrom and: nodeTo
|tab|
tab := ((nodeFrom links)select: [:link | (link to) = nodeTo.]).
tab ifEmpty: [ ^ nil. ] ifNotEmpty: [ ^ (tab first) ] 