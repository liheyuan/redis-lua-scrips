
### run
```
redis-cli --eval script.lua key1 key2 , arg1 arg2
```

### benchmark with lua script
```
redis-benchmark -n 1000000 EVAL "$(cat ./script.lua | tr -s '\n' '  ')" number_of_key key.. arg..
```

### load
```
echo "script load \"$(cat ./script.lua | tr -s '\n' '  ')\"" | redis-cli
```

### benchmark with lua sha
```
redis-benchmark -n 1000000 EVALSHA xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx number_of_key key.. arg..
```

### debug
```
redis-cli --ldb --eval script.lua mykey somekey , arg1 arg2
```

## lua script list
* seincr.lua : incr with sentry value check
* ratelimit.lua : ratelimit
* dislock.lua / disunlock.lua : lightweight redis lock / unlock (not redlock)
* bulkdel.lua : del by pattern in batch
* bulkexpire.lua : expire by pattern in batch
* cas.lua : compare and swap
* cad.lua : compare and delete 
* copy.lua : copy a key * value without knowing it's type
