local key = KEYS[1]
local val = ARGV[1]
local newVal = ARGV[2]

if redis.call('get', key) == val then
    redis.call('set', key, newVal)
    return 1
else
    return 0
end
