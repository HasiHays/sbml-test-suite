(*

category:      Test
synopsis:      Basic two reactions with three species in one compartment,
               and two species labeled as a boundary condition
componentTags: Compartment, Species, Reaction, Parameter 
testTags:      InitialAmount, BoundaryCondition
testType:      TimeCourse
levels:        1.2, 2.1, 2.2, 2.3

The model contains one compartment named compartment.
  There are three species named S1, S2 and S3 and two parameters named k1 and k2.
  Species S1 and S2 are labeled as SBML boundary species.  
  The model contains two reactions defined as:
[| | Reaction    |||||| Rate                    |
 | | S1+S2 -> S3 |||||| $k1*S1*S2*compartment$  |
 | | S3 -> S1+S2 |||||| $k2*S3*compartment$     |]

The initial conditions are as follows:
[|                                  || Value            || Units                     |
|              Initial amount of S1:|| $1.0 \x 10^-15$  || mole                      |
|              Initial amount of S2:|| $2.0 \x 10^-15$  || mole                      |
|              Initial amount of S3:|| $1.0 \x 10^-15$  || mole                      |
|             Value of parameter k1:|| $0.75$           || litre mole^-1^ second^-1^ |
|             Value of parameter k2:|| $0.25$           || second^-1^                |
| Volume of compartment compartment:|| $1$              || litre                     |]

The species values are given as amounts of substance to make it easier to
use the model in a discrete stochastic simulator, but (as per usual SBML
principles) they must be treated as concentrations where they appear in
expressions.

*)

newcase[ "00012" ];

addCompartment[ compartment, size -> 1 ];
addSpecies[ S1, initialAmount -> 1.0 10^-15, boundaryCondition -> True];
addSpecies[ S2, initialAmount -> 2.0 10^-15, boundaryCondition -> True];
addSpecies[ S3, initialAmount -> 1.0 10^-15];
addParameter[ k1, value -> 0.75 ];
addParameter[ k2, value -> 0.25 ];
addReaction[ S1+S2 -> S3, reversible -> False,
	     kineticLaw -> k1*S1*S2*compartment ];
addReaction[ S3 -> S1+S2, reversible -> False,
	     kineticLaw -> k2*S3*compartment ];

makemodel[]
