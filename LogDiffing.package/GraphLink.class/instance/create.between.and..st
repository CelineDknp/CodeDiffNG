subclass creation
create: status between: nodeFrom and: nodeTo
|newLink newProbability|
newProbability := self computeNewProbability: (nodeFrom graphFrom) with: (nodeTo graphFrom) status: status."Compute the probability"
newLink := GraphLinkDiff with: nodeFrom and: nodeTo withBefore: (newProbability at: 1) withAfter: (newProbability at: 2). "create the link"
newLink status: status.
newLink label: newProbability.
nodeFrom addLink: newLink.
^ newLink.
