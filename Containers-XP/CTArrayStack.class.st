"
Started to implement ArrayStack from this book https://opendatastructures.org/
But the first datastructure feels strange and it gave a strange view on the rest of the book. 

The book defines the state of ArrayStack as an array and a number representing the number of elements.
Here are the code snippets of the book.

```
T[] a;
int n; 
```

```
int size() {
   return n; }
```

```
 T set(int i, T x) {
   T y = a[i];
   a[i] = x;
   return y;
}
```

```
T get(int i) {
   return a[i];
}
```

```
void add(int i, T x) {
	if (n + 1 > a.length) resize();
	for (int j = n; j > i; j--)
		a[j] = a[j-1];
	a[i] = x;
	n++;
}
```

```
T remove(int i) {
	T x = a[i];
	for (int j = i; j < n-1; j++)
		a[j] = a[j+1];
	n--;
	if (a.length >= 3*n) resize();
	return x;
}

```

```
void resize() {
	T[] b = newArray(max(n*2,1));
	for (int i = 0; i < n; i++) {
		b[i] = a[i]; }
	a = b; }
```

## Analysis 
To me these definitions are bogus. The name is particularly not good because this is not a stack but a list. So a better name is SimpleArrayList or NaiveArrayList.

### About set and get 

- `set` and `get` do not check for n range. This is done in the Java implementation but not in the book. This is ok since array will raise an error if the bounds are not correct.

- More important, `set` does not update the number of elements, so using set break the invariant that n is the number of elements stored. 
- `set` should not return the previous value because it propagates null value
- why `set` and `get` are needed (I renamed them as at: at:put:) but they are not needed in a Stack API.

### API problems

The java implementation is better than the algo in the book but still some of them are bogus.
The Java implementation mentioned that ArrayStack is a copy of the JCF class ArrayList but this is not the same API in particular add(i, object) is not good because the user can add anywhere an element. 

Let us have a look at add `add(int i, T x)`

```
void add(int i, T x) {
	if (n + 1 > a.length) resize();
	for (int j = n; j > i; j--)
		a[j] = a[j-1];
	a[i] = x;
	n++;
}
```

Imagine that we have a ArrayStack with 5 of capacity and with 5 elements, the user can use add(3000, anObject). This example raises two problems:

- first the resize is not good because it will not grow enough :), here resize will grow to 10 only :). When giving the user the possibility to specify a given an index. Index should be validated. 
The Java implementation is better because it does bound check. 

```
T remove(int i) {
	T x = a[i];
	for (int j = i; j < n-1; j++)
		a[j] = a[j+1];
	n--;
	if (a.length >= 3*n) resize();
	return x;
}
```	
- Second what will happens if we remove a not occupied element, eg remove(8) on a collection of capacity 10 with 5 elements #(x x x x x _ _ _ _ _), 8 is in range, the collection keeps the same data but the number of elements is decreased. 
 

## Unclear points

It is unclear why elements are shifted in the remove or add. It looks like add is in fact an insertAt a given index. The fact that we can add an element at a given index is mixing lot of concerns.


 

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
