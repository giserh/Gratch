test
testVariableNameInUse
	| br |
	br := Breed new.
	self deny: (br variableNameInUse: 'a').
	br addVariable: 'a'.
	self assert: (br variableNameInUse: 'a').
	br deleteVariable: 'a'.
	self deny: (br variableNameInUse: 'a').