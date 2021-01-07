local key = KEYS[1];
local delta = tonumber(ARGV[1]);
local sentryVal = tonumber(ARGV[2]);

local val = redis.call('get', key);
local newVal = val + delta
if val then
    if delta > 0 and newVal > sentryVal then
        return -20000;
    end;
    if delta < 0 and newVal < sentryVal then
        return -20000;
    end;
else
    return -10000
end;

return redis.call('incrby', key, delta);
