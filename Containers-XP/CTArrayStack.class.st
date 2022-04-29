"
Started to implement ArrayStack from this book https://opendatastructures.org/
But the first datastructure feels strange and it gave a strange view on the rest of the book. 
The book defines the state of ArrayStack as an array and a number representing the number of elements.

```
T[] a;
int n; 
```

```
int size() {
   return n; }
```
For example add is defined as follows:

```
void add(int i, T x) {
   if (n + 1 > a.length) resize();
   for (int j = n; j > i; j--)
     a[j] = a[j-1];
   a[i] = x;
   n++;
}
```

Set is defined as follows: 
```
 T set(int i, T x) {
   T y = a[i];
   a[i] = x;
   return y;
}
```

 
To me these definition are bogus. 
Indeed 
- first `set` does not update the number of elements, so using set break the invariant that n is the number of elements stored. 
- second `set` should not return the previous value because it propagates null value
- third why `set` and `get` are needed (I renamed them as at: at:put:) but they are not needed in a Stack API. 

"
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
