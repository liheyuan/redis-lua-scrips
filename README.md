
### run
```
redis-cli --eval script.lua
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

## list
* seincr.lua : incr with sentry value check
