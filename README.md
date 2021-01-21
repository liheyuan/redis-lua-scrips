
### run
```
redis-cli --eval script.lua key1 key2 , arg1 arg2
```

### load
```
echo "script load \"$(cat ./script.lua | tr -s '\n' '  ')\"" | redis-cli
```

### benchmark
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
* cas.lua : compare and swap
* cad.lua : compare and delete 
