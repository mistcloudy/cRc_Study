function print(person) {
    if (!person) {
        console.log('not person');
        return;
    }
    console.log(person.name);
}

const person = null;
print(person);

// person is Falsy

console.log(!undefined);
console.log(!null);
console.log(!0);
console.log(!'');
console.log(!NaN);

// Truthy

console.log(!3);
console.log(!'hello');
console.log(!['array?']);
console.log(![]);
console.log(!{ value: 1 });

// Falsy

const value = { a: 1 };

const truthy = value ? true : false;

// Trinomial operator & Truthy+Falsy

