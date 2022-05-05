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

// slice

const numbers3 = [10, 20, 30, 40];
const value3 = numbers3.shift();
console.log(value3);
console.log(numbers3);

// shift

const value4 = numbers3.pop();
console.log(value4);
console.log(numbers3);

// pop

numbers3.unshift(5);
console.log(numbers3);

// unshift

const arr1 = [1, 2, 3];
const arr2 = [4, 5, 6];
const concated = arr1.concat(arr2);

console.log(concated);

// concat

console.log(array.join());
console.log(array.join(' '));
console.log(array.join(', '));

// join

const numbers4 = [1, 2, 3, 4, 5];

let sum = numbers4.reduce((accumulator, current) => {
    console.log({ accumulator, current });
    return accumulator + current;
}, 0);

console.log(sum);

  // reduce 