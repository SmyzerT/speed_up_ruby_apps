import http from 'k6/http';
import { check, sleep } from 'k6';

export let options = {
  // vus: 50,
  // stages: [
  //   { duration: '15s', target: 50 },
  //   { duration: '15s', target: 100 },
  //   { duration: '15s', target: 150 },
  //   { duration: '15s', target: 200 },
  //   { duration: '15s', target: 250 },
  //   { duration: '15s', target: 300 },
  //   { duration: '15s', target: 350 },
  //   { duration: '15s', target: 400 },
  //   { duration: '15s', target: 450 },
  //   { duration: '15s', target: 500 }
  // ],
  thresholds: {
    // http_req_duration: [{threshold: 'p(50)<500', abortOnFail: true, delayAbortEval: '5s'}]
  }
};

export default function () {
  let res = http.get('http://localhost:9292/', {timeout: '300s'});
  check(res, { 'status was 200': (r) => r.status == 200 });
  sleep(1)
}