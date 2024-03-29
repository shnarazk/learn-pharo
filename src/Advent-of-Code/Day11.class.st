"
Implement and evaluate A* algorithm!
"
Class {
	#name : #Day11,
	#superclass : #Object,
	#category : #'Advent-of-Code'
}

{ #category : #initialization }
Day11 class >> part1 [


	^self start: (LobbyState newFrom: { 0. 0. 0. 0. 1. 2. 1. 1. 1. 1 })
]

{ #category : #initialization }
Day11 class >> part2 [

	^ self start: (LobbyState newFrom: { 0. 0. 0. 0. 1. 2. 1. 1. 1. 1. 0. 0. 0. 0 })
]

{ #category : #initialization }
Day11 class >> start: start [

	"comment stating purpose of class-side method"

	"scope: class-variables  &  class-instance-variables"

	| instance |
	instance := self new.
	^ instance costToGoal:  start
]

{ #category : #computing }
Day11 >> costToGoal: aStart [

	| visit toCheck start goalIndex |
	visit := Bag new.
	toCheck := Heap new.
	start := aStart.
	goalIndex := aStart indexOfGoal.
	start pack.
	toCheck add: start pack.
	[ toCheck isEmpty ] whileFalse: [ 
		| state index |
		state := toCheck removeFirst.
		"self progress: state on: visit."
		index := state index.
		index = goalIndex ifTrue: [ ^ state cost ].
		(visit includes: index) ifFalse: [ 
			visit add: index.
			state unpack adjacentStates collect: [ :next | 
				toCheck add: next pack ] ] ].
	self error: 'No more candidates'
]

{ #category : #debugging }
Day11 >> progress: state on: visit [

Transcript
			show: 'Expand '; show: state locations;
			show: ' at '; show:state floor;
			show: ' cost: '; show: state cost;
			show: ' goal? '; show: state isGoal;
			show: ' visited? '; show: (visit includes: state index);
			cr.
]
