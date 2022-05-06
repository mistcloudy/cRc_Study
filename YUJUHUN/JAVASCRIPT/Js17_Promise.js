const myPromise = new Promise((resolve, reject) => {
    setTimeout(() => {
        resolve(1);
    }, 1000);
});

myPromise.then(n => {
    console.log(n);
});

// resolve

const myPromise2 = new Promise((resolve, reject) => {
    setTimeout(() => {
        reject(new Error());
}, 1000);
});

myPromise2.then(n => {
    console.log(n);
}).catch(error => {
    console.log(error);
});

// reject

function increaseAndPrint(n) {
    return new Promise((resolve, reject) =>{
        setTimeout(() =>{
            const value = n + 1;
            if (value === 5) {
                const error = new Error();
                error.name = 'ValueIsFiveError';
                reject(error);
                return;
            }
            console.log(value);
            resolve(value);
        }, 1000);
    });
}

increaseAndPrint(0)
.then(increaseAndPrint)
.then(increaseAndPrint)
.then(increaseAndPrint)
.then(increaseAndPrint)
.then(increaseAndPrint)
.catch(e => {
    console.error(e)
});

// promise