local pattern = ARGV[1];
local max_cnt = tonumber(ARGV[2]);

local result = redis.call('scan', 0, 'match', pattern, 'count', max_cnt)[2]
if next(result) == nil then
    return 0
else
    return redis.call('del', unpack(result))
end
