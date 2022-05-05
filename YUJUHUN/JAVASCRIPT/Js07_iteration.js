for (let i = 0; i < 10; i++) {
    console.log(i);
}

for (let i = 10; i > 0; i--) {
    console.log(i);
}

const names = ['puppy', 'kity', 'bunny'];

for (let i = 0; i < names.length; i++) {
    console.log(names[i]);
}

// Array & for statement

let i = 0;
while (i < 10) {
    console.log(i);
    i++;
}

// while

let numbers = [10, 20, 30, 40, 50];
for (let number of numbers) {
    console.log(number);
}

// for...of

const doggy = {
    name: 'puppy',
    sound: 'wang',
    age: 2
};

console.log(Object.entries(doggy));
console.log(Object.keys(doggy));
console.log(Object.values(doggy));

for (let key in doggy) {
    console.log(key + ' : ' + doggy[key]);
}

// for...in

for (let i = 0; i < 10; i++) {
    if (i === 2) continue; // excute to next loop
    console.log(i);
    if (i === 5) break; // finish to loop
}

// continue & break 

function sumOf(numbers) {
    let sum = 0;
    for (let i = 0; i < numbers.length; i++) {
        sum += numbers[i];
    }
    return sum;
}

const result = sumOf([1, 2, 3, 4, 5]);
console.log(result);

function biggerThanThree(numbers) {
    const array = [];
    for (let i = 0; i < numbers.length; i++) {
        if (numbers[i] <= 3) continue;
        array.push(numbers[i]);
    }
    return array;
}

const numbers3 = [1, 2, 3, 4, 5, 6, 7];
console.log(biggerThanThree(numbers3));

// practice