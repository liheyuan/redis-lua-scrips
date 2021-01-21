local key = KEYS[1];
local delta = tonumber(ARGV[1]);
local sentryVal = tonumber(ARGV[2]);

local val = tonumber(redis.call('get', key)) or 0;

local newVal = val + delta;
if val then
    if delta > 0 and newVal > sentryVal then
        return nil;
    end;
    if delta < 0 and newVal < sentryVal then
        return nil;
    end;
else
    return nil;
end;

return redis.call('incrby', key, delta);
