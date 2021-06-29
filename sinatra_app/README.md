# Preparation
- install k6 https://k6.io/docs/getting-started/installation/
- install gems
```
bundle install
```

Run puma or falcon server

# Puma
```
bundle exec puma -w 8 -b tcp://127.0.0.1:9292 --preload
```
-w - number of ruby workers to handle requets

# Falcon
```
bundle exec falcon -n 8 --cache -b tcp://127.0.0.1:9292
```
-n number of falcon process to handle requests

Run load test

# Load test
install k6 https://k6.io/docs/getting-started/installation/
```
k6 run -d 5s -u 200 test.js
```