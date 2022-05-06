function isAnimal(name) {
    const animals = ['cat', 'dog', 'turtle', 'racoon'];
    return animals.includes(name);
}
console.log(isAnimal('dog'));
console.log(isAnimal('notebook'));

// include

function getSound(animal) {
    const sounds = {
        dog: 'wang!',
        cat: 'nya~',
        bird: 'hwi',
        pizon: 'gugugu'
    };
    return sounds[animal] || '...?';
}

console.log(isAnimal('dog'));
console.log(isAnimal('pizon'));

// Use Object