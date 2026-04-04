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

type DebounceStateV2 = {
	time: number,
	duration: number,
}

export type ClassV2 = {
	_states: {[string]: DebounceStateV2},

	Run: (self: ClassV2, key: string, delayTime: number, fn: () -> ()) -> (boolean),
	IsActive: (self: ClassV2, key: string) -> (boolean),

	Skip: (self: ClassV2, key: string) -> (),

	Destroy: (self: ClassV2) -> (),
}

return {}
