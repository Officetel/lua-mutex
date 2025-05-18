-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at

--------------------[ 베이스 ]--------------------

-- using
local insert = table.insert
local remove = table.remove

local running = coroutine.running
local yield = coroutine.yield
local resume = coroutine.resume

-- type
export type Mutex_Class = {
	[number] : thread,
}

export type new = () -> Mutex_Class
export type lock = (Mutex_Class) -> ()
export type unlock = (Mutex_Class) -> ()

export type Module = {
	new : new,
	
	lock : lock,
	unlock : unlock,
}

--------------------[ 선언 ]--------------------

local new : new

local lock : lock
local unlock : unlock

local module : Module

--------------------[ 정의 ]--------------------

new = function()
	return {}
end

lock = function(self)
	insert(self, running)
	if #self ~= 1 then
		yield()
	end
end
unlock = function(self)
	remove(self, 1)
	if #self ~= 0 then
		resume(self[1])
	end
end

module = {
	new = new,
	
	lock = lock,
	unlock = unlock,
}

return module
