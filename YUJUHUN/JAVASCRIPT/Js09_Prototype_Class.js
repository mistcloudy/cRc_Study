/* function Animal(type, name, sound) {
    this.type = type;
    this.name = name;
    this.sound = sound;
    this.say = function() {
        console.log(this.sound);
    };
}

const dog = new Animal('dog', 'doggy', 'wang');
const cat = new Animal('cat', 'kity', 'nya');

dog.say();
cat.say();

// Object Constructor



Animal.prototype.say2 = function() {
    console.log(this.sound);
};
Animal.prototype.sharedValue = 1;

dog.say2();
cat.say2();

console.log(dog.sharedValue);
console.log(cat.sharedValue);

// prototype

*/

class Animal{
    constructor(type, name, sound) {
        this.type = type;
        this.name = name;
        this.sound = sound;
    }
    say() {
        console.log(this.sound);
    }
}

class Dog extends Animal {
    constructor(name, sound) {
        super('dog', name, sound)
    }
}

class Cat extends Animal {
    constructor(name, sound) {
        super('cat', name, sound)
    }
}


const dog = new Dog( 'doggy', 'wang');
const cat = new Cat( 'kity', 'nya');

dog.say();
cat.say();

// Class