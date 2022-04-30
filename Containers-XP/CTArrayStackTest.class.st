Class {
	#name : #CTArrayStackTest,
	#superclass : #TestCase,
	#category : #'Containers-XP'
}

{ #category : #tests }
CTArrayStackTest >> testCapacity [

	| as |
	as := CTArrayStack new.
	self assert: as capacity equals: 20  
]

{ #category : #tests }
CTArrayStackTest >> testSize [

	| as |
	as := CTArrayStack new.
	self assert: as size equals: 0.
	as at: 3 put: 'b'. 
	self assert: as size equals: 1.
	as at: 4 put: 'c'.
	self assert: as size equals: 2.
	as at: 4 put: 'd'.
	self assert: as size equals: 2.
]
