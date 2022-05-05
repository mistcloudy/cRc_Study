function biggerThanThree(numbers) {
    const newNumbers = [];
    for (let i = 0; i < numbers.length; i ++){
      if (numbers[i] < 4) continue;
      newNumbers.push(numbers[i]);
    }
    return newNumbers
  }
  
  const numbers = [1, 2, 3, 4, 5, 6, 7];
  console.log(biggerThanThree(numbers)); // [4, 5, 6, 7]
  