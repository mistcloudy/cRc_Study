function sleepy(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function makeError() {
    await sleepy(1000);
    const error = new Error();
    throw error;
}

async function process() {
    try {
        await makeError();
    } catch (e){
        console.error(e);
    }
}

process();

// basic

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

const getDog = async () => {
    await sleep(1000);
    return 'doggy';
};

const getRabbit = async () => {
    await sleep(500);
    return 'bunny';
};

const getTurtle = async () => {
    await sleep(1000);
    return 'turtly';
};

async function process2() {
    // const first = await Promise.race([
    const [dog, rabbit, turtle] = await Promise.all([
        getDog(),
        getRabbit(),
        getTurtle()
    ]);
    //console.log(first);
console.log(dog);
console.log(rabbit);
console.log(turtle);

}

process2();

 // Promis.all & race