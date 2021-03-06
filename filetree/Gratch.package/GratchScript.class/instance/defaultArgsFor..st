blocks
defaultArgsFor: blockSpec
	| sel breeds args lists |
	sel := (blockSpec at: 3) asSymbol.
	args := blockSpec copyFrom: 4 to: blockSpec size.
	breeds := self project scriptsForMenu.
	(#(#kill:breed:) includes: sel)
		ifTrue: [ ^ args
				at: 2 put: breeds first;
				yourself ].
	lists := self listVarNames.
	lists notEmpty
		ifTrue: [ (#(clearList: lineCountOfList: #list:contains:) includes: sel)
				ifTrue: [ ^ args
						at: 1 put: lists first;
						yourself ].
			(#(#append:toList: #deleteLine:ofList: #getLine:ofList: #setLine:ofList:to:)
				includes: sel)
				ifTrue: [ ^ args
						at: 2 put: lists first;
						yourself ] ].
	^ super defaultArgsFor: blockSpec