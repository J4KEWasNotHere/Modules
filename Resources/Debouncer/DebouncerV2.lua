--!strict
--!optimize 2

local Types = require("@self/Types")

local Debounce = {}
Debounce.__index = Debounce

-- Utility

local function currentTime(): number -- In case you want to change the method
	return os.clock()
end

-- Constructor

function Debounce.new()
	local self = {_states = {}}
	return setmetatable(self, Debounce)
end

-- Runs a function if the key isn't in an active debounce
function Debounce.Run(self: Types.ClassV2, key: string, delayTime: number, fn: () -> ())
	if self:IsActive(key) then
		return false
	end
	
	self._states[key] = {
		time = currentTime(),
		duration = delayTime
	}
	
	fn()
	return true
end

-- Checks if a debounce is active for the given key
function Debounce.IsActive(self: Types.ClassV2, key: string)
	local data = self._states[key]
	if not data then
		return false
	end
	
	if (currentTime() - data.time) > data.duration then
		self._states[key] = nil
		return false
	end
	
	return true
end

-- Cancels a running debounce
function Debounce.Skip(self: Types.ClassV2, key: string)
	self._states[key] = nil
end

-- Cancels all debounces and clears the table.
function Debounce.Clean(self: Types.ClassV2)
	table.clear(self._states)
end

return Debounce
