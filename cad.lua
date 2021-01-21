local key = KEYS[1]
local val = ARGV[1]

if redis.call('get', key) == val then
    redis.call('del', key)
    return 1
else
    return 0
end
