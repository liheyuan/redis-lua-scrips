local key = KEYS[1]
local idfy = ARGV[1]
local timeout_secs = tonumber(ARGV[2])

if redis.call('set', key, idfy, 'NX', 'EX', timeout_secs) then
    return 1
else
    return 0
end
