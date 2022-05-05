const superheroes = ['ironman', 'captainAmerica', 'tor', 'doctorStrange'];

superheroes.forEach(hero => {
    console.log(hero);
})

// forEach

const array = [1, 2, 3, 4, 5, 6, 7, 8];

const squared = array.map(n => n * n);
console.log(squared);

// map

const index = superheroes.indexOf('tor');
console.log(index);

// indexOf

const todos = [
    {
      id: 1,
      text: '자바스크립트 입문',
      done: true
    },
    {
      id: 2,
      text: '함수 배우기',
      done: true
    },
    {
      id: 3,
      text: '객체와 배열 배우기',
      done: true
    },
    {
      id: 4,
      text: '배열 내장함수 배우기',
      done: false
    }
  ];

  const index2 = todos.findIndex(todo => todo.id === 3);
  console.log(index2);

  // findIndex

  const todo = todos.find(todo => todo.id === 3);
  console.log(todo);

  // find 

  const tasksNotDone = todos.filter(todo => !todo.done);
  console.log(tasksNotDone);

  // filter

  const numbers = [10, 20, 30, 40];
  const index3 = numbers.indexOf(30);
  numbers.splice(index3, 1);
  console.log(numbers);

  // splice

  const numbers2 = [10, 20, 30, 40];
  const sliced = numbers2.slice(0, 2);

  console.log(sliced);
  console.log(numbers2);

  