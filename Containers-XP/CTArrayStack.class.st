Class {
	#name : #CTArrayStack,
	#superclass : #Object,
	#instVars : [
		'array',
		'size'
	],
	#category : #'Containers-XP'
}

{ #category : #accessing }
CTArrayStack >> at: anIndex [ 

	^ array at: anIndex 
]

{ #category : #accessing }
CTArrayStack >> at: anIndex put: aValue [
	
	(array at: anIndex) ifNil: [ size := size + 1 ].
	array at: anIndex put: aValue
]

{ #category : #accessing }
CTArrayStack >> capacity [
	^ array size
]

{ #category : #initialization }
CTArrayStack >> initialize [

	super initialize.
	array := Array new: 20.
	size := 0.
]

{ #category : #accessing }
CTArrayStack >> size [ 
	^ size
]
