function add(a, b) {
    return a + b;
    console.log('This code is not being called!');
}

const sum = add(1, 2);
console.log(sum);

function hello(name) {
    console.log('Hello, ' + name + '!');
}

hello('velopert');

function getGrade(score) {
    if (score === 100) {
        return 'A+';
    } else if (score >= 90) {
        return 'A';
    } else if (score === 89) {
        return 'B+';
    } else if (score >= 80) {
        return 'B';
    } else if (score === 79) {
        return 'C+';
    } else if (score >= 70) {
        return 'C';
    } else if (score === 69) {
        return 'D+';
    } else if (score >= 60) {
        return 'D';
    } else {
        return 'F';
    }
}

const grade = getGrade(90);
console.log(grade);

// Converting scores to grades

