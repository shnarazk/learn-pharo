"
A Sample of Spec2

```
MBApplication new run.
```

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #MBApplication,
	#superclass : #SpApplication,
	#category : #MyPackage
}

{ #category : #accessing }
MBApplication >> start [

	^ (self new: MBPresenter) openWithSpec
]
