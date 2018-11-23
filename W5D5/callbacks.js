//part 1
let func = function() {}

function setTimeout (function () {
  alert('HAMMER TIME!');
}, 5000);


//part 2
function hammerTime(time) {
  this.setTimeout(function () {
    alert(`${time} is hammertime!`);
  });
}

//part 3
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits () {
  let first, second;

  reader.question('Would you like some tea?', (result) => {
    first = result;
    console.log(`Reply: ${result}.`);
  });

  reader.question('Would you like some biscuits?', (result) => {
    second = result;
    console.log(`Reply: ${result}.`);
  });

  const firstResult = (first === 'yes') ? 'do' : 'don\'t';
  const secondResult = (second === 'yes') ? 'do' : 'don\'t';
  console.log(`So you ${firstResult} want tea and you ${secondResult} want biscuits.`);
  reader.close();
}
