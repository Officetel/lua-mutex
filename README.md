# lua-mutex

## Support
There is no external dependency, so this script is fully supported in Lua 5.1, but not on type systems.
Please remove it if necessary.
외부 의존성이 없으므로 이 스크립트는 Lua 5.1에서는 완전히 지원되지만, 타입 시스템에서는 지원되지 않습니다.
필요하다면 제거해 주세요.

## Example
```lua
local mutex = require("mutex")

-- using
local mutex_new = mutex.new
local mutex_lock = mutex.lock
local mutex_unlock = mutex.unlock

local count = 0
local test = mutex_new()

mutex_lock(test)
count = count + 1
print(count)
mutex_unlock(test)

-- When you are in a different thread state
-- 다른 스레드 상태에 있을 때
mutex_lock(test)
count = count + 1
print(count)
mutex_unlock(test)
```
