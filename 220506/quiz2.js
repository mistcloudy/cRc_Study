function max(...rest) {
    let temp = 0;
    rest.forEach( n => {
      if(temp < n){
        temp = n;
      }
    })
    return temp;
  }
  
  const result = max(1, 2, 3, 4, 10, 5, 6, 7);
  console.log(result);