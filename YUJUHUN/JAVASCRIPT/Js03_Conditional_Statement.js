const a = 1;
if (a + 1 === 2) {
    console.log('a + 1 is 2.');
} 

const b = 1;
if (true) {
    const b = 2;
    console.log('Value of b in if statement is ' + b);
}
console.log('Value of b out if statement is ' + b);

// if Statement

const c = 10;
if (a > 15) {
    console.log('a is greater than 15');
} else {
    console.log('a is not greater than 15');
}

// if-else Statement

const d = 10;
if (d === 5) {
    console.log('this is 5!');
} else if (d === 10) {
    console.log('this is 10!');
} else {
    console.log('this is not 5 and 10.');
}

// if-else if Statement

const device = 'iphone';

switch (device){
    case 'iphone':
        console.log('this is iphone!');
        break;
    case 'ipad':
        console.log('this is ipad');
        break;
    case 'galaxy note':
        console.log('this is galaxy note!');
        break;        
    default:
        console.log("I don't know");
}

// switch/case Statement