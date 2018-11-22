function madLib(verb, adjective, noun) {
  return 'We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.'
}

function isSubstring(searchStr, subString) {
  return searchStr.includes(subString)
}

function fizzBuzz(array) {
  new_arr = [];

  for (i = 0; i < array.length; i++) {
    el = array[i];

    if (el % 3 === 0 && el % 5 !== 0) || (el % 5 === 0 && el % 3 !== 0){
      new_arr.push(el);
    }
  }

  return new_arr;
}

// OR

function fizzBuzz(arr) {
  const new_arr = [];

  arr.forEach(el => {
    if ((el % 3 === 0) ^ (el % 5 === 0)) {
      new_arr.push(el);
    }
  });

  return new_arr;
}



function isPrime(num) {
  if (num < 2) {
    return false;
  }

  for (let i = 2; i < num; i++) {
    if (num % i === 0) {
      return false;
    }
  }

  return true;
}

function firstNPrimes(num) {
  let sumOfPrimes = 0;
  let countPrimeNums = 0;
  let i = 2;

  while (countPrimeNum < num) {
    if isPrime(i) {
      sumOfPrimes += i;
      countPrimeNums += 1;
    }
  }

  return sumOfPrimes;
}
