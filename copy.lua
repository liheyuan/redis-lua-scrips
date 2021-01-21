local srcKey = KEYS[1]
local dstKey = KEYS[2]

if redis.call('exists', srcKey) == 0 then
    return 0
end

if redis.call('exists', dstKey) == 1 then
    redis.call('del', dstKey)
end

redis.call('restore', dstKey, 0, redis.call('dump', srcKey))
return 1
