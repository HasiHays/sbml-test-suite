(*

category:        Test
synopsis:        A hierarchical model with time conversion and a reference to a modified reaction.
componentTags:   AssignmentRule, Compartment, Parameter, Reaction, Species, comp:ModelDefinition, comp:Submodel
testTags:        Amount, HasOnlySubstanceUnits, InitialValueReassigned, comp:TimeConversionFactor
testType:        TimeCourse
levels:          3.1
generatedBy:     Analytic
packagesPresent: comp

In the submodel, there is a reference to a reaction's SId in an assignment rule math.  This reference must be modified by the time conversion factor just as the kinetic law itself is modified by the time conversion factor.

The 'flattened' version of this hierarchical model contains:
* 1 species (sub1__s1)
* 2 parameters (timeconv, sub1__p80)
* 1 compartment (sub1__C)

There is one reaction:

[{width:30em,margin-left:5em}|  *Reaction*  |  *Rate*  |
| -> sub1__s1 | $1 / timeconv * 10$ |]


There is one rule:

[{width:30em,margin-left:5em}|  *Type*  |  *Variable*  |  *Formula*  |
| Assignment | sub1__p80 | $sub1__J0 / (1 / timeconv) + 6$ |]

The initial conditions are as follows:

[{width:35em,margin-left:5em}|       | *Value* | *Constant* |
| Initial amount of species sub1__s1 | $1$ | variable |
| Initial value of parameter timeconv | $60$ | constant |
| Initial value of parameter sub1__p80 | $sub1__J0 / (1 / timeconv) + 6$ | variable |
| Initial volume of compartment 'sub1__C' | $1$ | constant |]

Note: The test data for this model was generated from an analytical
solution of the system of equations.

*)
