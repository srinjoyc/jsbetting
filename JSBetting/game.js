var prompt = require('prompt-sync')();

var getBet = function (money){
	var bet = prompt('What is your bet?');
  if(bet > money){
    console.log('You cannot place a bet higher than your money');
  }
	return Number(bet);
}

var getGuess = function (){
	var guess = prompt('What is your guess? 1-10\n');
  while(guess < 0 || guess >10){
    guess = ('Try a guess between 1-10 again\n');
  }
	return Number(guess);
}

var getRandom = function(){
	return Math.floor((Math.random() * 10) + 1);
}

var checkWin = function (guess){
  var random = getRandom();
	if(random === guess){
    console.log('Correct!')
		return true;
	}else if(random+1 == guess || random-1 == guess){
    return NaN;
  }else {
    console.log('The correct number was ' +random);
		return false;
	}
}

var moneyManger = function (win,bet,money){
  if(win){
    money+= bet;
    console.log('You won ' + bet);
  }else if (win==NaN){
    console.log('Close, no loss or win');
  }
  else {
    money-=bet;
    console.log('You lost ' + bet);
  }
  return money;
}

var main = function(){
  var play = '1';
  var money = 100;
  console.log("You have " + money + " left.");
  while(play==='1'){
    if(money <= 0){
      console.log("You loose!");
      break;
    }
    else {
     var bet = getBet();
     var guess = getGuess();
     var win = checkWin(guess);
     var money = moneyManger(win,bet,money);
     console.log("You have " + money + " left.");
     play = prompt('Keep playing? Press 1 to continue \n')
    }
  }
}

main();