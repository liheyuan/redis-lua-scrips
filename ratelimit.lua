local key = KEYS[1]
local limit = tonumber(ARGV[1])

local curLimit = tonumber(redis.call('get', key) or "0")

if curLimit + 1 > limit then
    return 0
else
    redis.call("incrby", key, 1)
    redis.call("expire", key, 1)
    return 1
end
