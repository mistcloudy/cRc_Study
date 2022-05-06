const dog = {
    name: 'doggy'
};

function getName(animal) {
    return animal && animal.name;
}

const name = getName(dog);
console.log(name);

// && operator Truthy

const namelessDog = {
    name: ''
};

function getName2(animal) {
    const name = animal && animal.name;
    return name || 'none name animal';
}

const name2 = getName2(namelessDog);
console.log(name2);

// || operator Falsy
