An object representing a link in the graph (between to nodes) with a transition probability and a label (unused)

Constructors:
- GraphLink with: aNodeFrom
- GraphLink with: aNodeFrom and: aNodeTo
- GraphLink with: aNodeFrom and: aNodeTo with: aTransitionProbability

Instance variables:
- label: the label of the link (unused)
- probability: the probability to use this link (float)
- from: the node from which the link starts
- to: the node to which the link goes