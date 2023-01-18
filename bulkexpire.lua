local pattern = ARGV[1];
local max_cnt = tonumber(ARGV[2]);
local expire_sec = tonumber(ARGV[3]);

local cnt = 0
for i, name in ipairs(redis.call('scan', 0, 'match', pattern, 'count', max_cnt)[2]) do
    redis.call('EXPIRE', name, expire_sec);
    cnt = cnt + 1
end
return cnt;
