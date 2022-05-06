const slime = {
    name: 'slime'
};

const cuteSlime = {
    ...slime,
    attribute: 'cute'
};

const purpleCuteSlime = {
    ...cuteSlime,
    color: 'purple'
};

console.log(slime);
console.log(cuteSlime);
console.log(purpleCuteSlime);

const animals = ['dog', 'cat', 'bird'];
const anotherAnimals = [...animals, 'pizon'];
console.log(animals);
console.log(anotherAnimals);

// spread operator

const { color, ...cutySlime } = purpleCuteSlime;
console.log(color);
console.log(cutySlime);

const { attribute, ...slimy } = cutySlime;
console.log(attribute);
console.log(slimy);

const numbers = [0, 1, 2, 3, 4, 5, 6];

const [one, ...rest] = numbers;

console.log(one);
console.log(rest);


function sum(...rest) {
    return rest.reduce((acc, cur) => acc + cur, 0);
}

const result = sum(1, 2, 3, 4, 5, 6);
console.log(result);

// rest

function sum(...rest) {
    return rest.reduce((acc, cur) => acc + cur, 0);
}

const number = [1, 2, 3, 4, 5, 6];
const result2 = sum(...number);
console.log(result2);

// Argument & spread