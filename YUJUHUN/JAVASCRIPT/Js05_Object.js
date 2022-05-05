const dog = {
    name: 'puppy',
    age: 2
};

console.log(dog.name);
console.log(dog.age);

const sample = {
    'key with space': true
}; // When there's an empty space.


const ironMan = {
    name: 'Tony stark',
    actor: 'lobert dauny junior',
    alias: 'Iron Man'
};

const captainAmerica = {
    name: 'steaven lozers',
    actor: 'kris evans',
    alias: 'Captain America'
};

console.log(ironMan);
console.log(captainAmerica);

function print({ alias, name, actor }) {
    const text = 'actor who plays ' + alias + '(' + name + ')' + ' is ' + actor + '.';
    console.log(text);
}

print(ironMan);
print(captainAmerica);

// Object Unstuructured assignment

const cat = {
    name: 'kity',
    sound: 'nyan!',
    say: function () {
        console.log(this.sound);
    }
};

cat.say();

// Put a function inside an object

const numbers = {
    a: 1,
    b: 2,
    get sum() {
        console.log('sum function is executed!');
        return this.a + this.b;
    }
};

console.log(numbers.sum);
numbers.a = 5;
console.log(numbers.sum);

// Getter Function

const numbers2 = {
    _a: 1,
    _b: 2,
    sum: 3,
    calculate() {
        console.log('calculate');
        this.sum = this._a + this._b;
    },
    get a() {
        return this._a;
    },
    get b() {
        return this._b;
    },
    set a(value) {
        console.log('a is changed.');
        this._a = value;
        this.calculate();
    },
    set b(value) {
        console.log('b is changed.');
        this._b = value;
        this.calculate();
    }
};

console.log(numbers2.sum);
numbers2.a = 5;
numbers2.b = 7;
numbers2.a = 9;
console.log(numbers2.sum);
console.log(numbers2.sum);
console.log(numbers2.sum);

// Setter Function