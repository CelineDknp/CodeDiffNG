subclass creation
create: status between: nodeFrom and: nodeTo
|newLink newProbability|
newProbability := self computeNewProbability: (nodeFrom graphFrom) with: (nodeTo graphFrom) status: status."Compute the probability"
newLink := GraphLinkDiff with: nodeFrom and: nodeTo with: newProbability. "create the link"
newLink status: status.
newLink label: newProbability.
nodeFrom addLink: newLink.
^ newLink.
