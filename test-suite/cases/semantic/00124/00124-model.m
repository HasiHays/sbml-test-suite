(*

category:      Test
synopsis:      Rate rule using a functionDefinition used to determine value of parameter
               which is used in a reaction.
componentTags: Compartment, Species, Reaction, Parameter, FunctionDefinition, RateRule 
testTags:      InitialAmount, NonConstantParameter
testType:      TimeCourse
levels:        2.1, 2.2, 2.3

The model contains one compartment named compartment.
  There are three species named S1, S2 and S3 and three parameters named k1, k2 and k3.
  The model contains two reactions defined as:
[| | Reaction |||||| Rate |
 | | S1+S2 -> S3 |||||| $k1*S1*S2*compartment$  |
 | | S3 -> S1+S2 |||||| $k2*S3*compartment$  |]

  The model contains one rule that determines the value of parameter k1:
[|| Type || Variable || Formula |
 || Rate || k1 || $add(1*k2, k3)$  |]


The model contains one functionDefinition defined as:
[|| Id      | Arguments || Formula |
 || add | x, y || $x+y$ |]


The initial conditions are as follows:
[|                                  ||          Value  || Units                     |
|              Initial amount of S1:|| $          1.0$ || mole                      |
|              Initial amount of S2:|| $          2.0$ || mole                      |
|              Initial amount of S3:|| $          1.0$ || mole                      |
|             Value of parameter k1:|| $          1.7$ || litre mole^-1^ second^-1^ |
|             Value of parameter k2:|| $          0.3$ || second^-1^ |
|             Value of parameter k3:|| $         -0.1$ || litre mole^-1^ second^-1^ |
| Volume of compartment compartment:|| $            1$ || litre                     |]

The species values are given as amounts of substance to make it easier to
use the model in a discrete stochastic simulator, but (as per usual SBML
principles) they must be treated as concentrations where they appear in
expressions.

*)

newcase[ "00124" ];

addFunction[ add, arguments -> {x, y}, math -> x+y];
addCompartment[ compartment, size -> 1 ];
addSpecies[ S1, initialAmount -> 1.0 ];
addSpecies[ S2, initialAmount -> 2.0 ];
addSpecies[ S3, initialAmount -> 1.0 ];
addParameter[ k1, value -> 1.7 , constant->False];
addParameter[ k2, value -> 0.3 ];
addParameter[ k3, value -> -0.1 ];
addRule[ type->RateRule, variable -> k1, math -> add[1*k2, k3]];
addReaction[ S1+S2 -> S3, reversible -> False,
	     kineticLaw -> k1*S1*S2*compartment ];
addReaction[ S3 -> S1+S2, reversible -> False,
	     kineticLaw -> k2*S3*compartment ];

makemodel[]
