const object = { a: 1 };

function print({ a, b = 2 }) {
    console.log(a);
    console.log(b);
}

print(object);

// Setting default value

const animal = {
    name: 'doggy',
    type: 'dog'
};

const { name: nickname } = animal
console.log(nickname);

// Change to name

const array = [1];
const [one, two = 2] = array;

console.log(one);
console.log(two);

// Assignment to array

const deepObject = {
    state: {
        information: {
            name: 'velopert',
            languages: ['korean', 'english', 'chinese']
        }
    },
    value: 5
};

const { name, languages } = deepObject.state.information;
const { value } = deepObject;

const extracted = {
    name,
    languages,
    value
};

console.log(extracted);

// Deep Object