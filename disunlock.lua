local key = KEYS[1]
local idfy = ARGV[1]

if redis.call('get', key) == idfy then
    return redis.call('del', key)
else
    return 0
end
