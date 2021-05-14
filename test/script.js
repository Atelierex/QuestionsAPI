import http from 'k6/http';
import { check, sleep } from 'k6';

export let options = {
  stages: [
    { duration: '10s', target: 10 },
    { duration: '15s', target: 100 },
    { duration: '1m', target: 1000 },
  ],
};

// GET REQUEST TEST

export default function () {
  let res = http.get('http://localhost:3000/qa/questions?product_id=5&count=2000');
  check(res, {'status was 200': r => r.status === 200});
  sleep(1);
}


// POST REQUEST TEST

// export default function () {
//   const url = 'http://localhost:3000/qa/questions';


//   let data = { body: 'Is this water resistant?', name: 'Strawhat Luffy', email: 'strawhat.luffy@gmail.com', product_id: 5};


//   // Using a JSON string as body
//   let res = http.post(url, JSON.stringify(data));

//   // console.log(res.json().json.name); // Bert


//   // // Using an object as body, the headers will automatically include
//   // // 'Content-Type: application/x-www-form-urlencoded'.
//   // res = http.post(url, data);
//   // console.log(res.json().form.name); // Bert

// }

