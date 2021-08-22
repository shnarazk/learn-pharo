"
Spec for NHKChecker
"
Class {
	#name : #NHKCheckerPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'listPresenter'
	],
	#category : #MyPackage
}

{ #category : #initialization }
NHKCheckerPresenter >> initializePresenters [

	listPresenter := self newTable
		                 items: (application channels at: 'g1') values asOrderedCollection;
		                 addColumn: (SpStringTableColumn
				                  title: 'clock'
				                  evaluated: [ :program | program at: 'start_time' ]);
		                 addColumn: (SpStringTableColumn
				                  title: 'タイトル'
				                  evaluated: [ :program | program at: 'title' ]);
		                 yourself.

	self layout: (SpBoxLayout newVertical
			 spacing: 5;
			 add: listPresenter;
			 yourself)
]

{ #category : #initialization }
NHKCheckerPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'NHK now';
		initialExtent: 700@300
]

{ #category : #initialization }
NHKCheckerPresenter >> updatePresenter [ 
	listPresenter items: (application channels at: 'g1') values asOrderedCollection .
]