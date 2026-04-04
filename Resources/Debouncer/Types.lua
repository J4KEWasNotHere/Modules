--!strict

type DebounceState = {
	timer: thread?
}

export type Class = {
	_states: {[string]: DebounceState},
	
	Run: (self: Class, key: string, delayTime: number, fn: () -> ()) -> (boolean),
	IsActive: (self: Class, key: string) -> (boolean),
	
	Skip: (self: Class, key: string) -> (),
	
	Destroy: (self: Class) -> (),
}

-- If your not using V2, remove this..

type DebounceStateV2 = {number}

export type ClassV2 = {
	_states: {[string]: DebounceStateV2},
	
	Run: (self: Class, key: string, delayTime: number, fn: () -> ()) -> (boolean),
	IsActive: (self: Class, key: string) -> (boolean),
	
	Skip: (self: Class, key: string) -> (),
	
	Destroy: (self: Class) -> (),
}

return {}
