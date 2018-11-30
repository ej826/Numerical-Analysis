%Author: Emily Justus

%This program is a type of the Gambler's Ruin problem. The idea is that you
%start out with $100 and you have a 50/50 chance of winning $100 or losing
%$100. This process is repeated k amount of times, while the amount of
%money (currMoney) is less than $10,000. The program will output the max
%number of rounds till you lose all your money or reach k, the least number
%of rounds till you lose all your money, and the least number of rounds to
%get desired money.

k = 10000;
maxRounds = 0;
leastRounds = 100000000;
leastRoundsToMoney = 100000000;

for i = 1:k
    currMoney = 100;
    rounds = 0;
    while currMoney < 10000
       if currMoney == 0
           break;
       end
       prob = rand;
       if prob < 0.5
           currMoney = currMoney + 100;
       else
           currMoney = currMoney - 100;
       end
       rounds = rounds + 1;
    end
    if maxRounds < rounds
        maxRounds = rounds;
    end
    if leastRounds > rounds
        leastRounds = rounds;
    end
    if leastRoundsToMoney > rounds && currMoney == 10000
        leastRoundsToMoney = rounds;
    end    
end
fprintf("The max number of rounds till lose all money or reach desired: %d\n", maxRounds);
fprintf("The least number of rounds till lose all money: %d\n", leastRounds);
fprintf("The least number of rounds to desired money: %d\n", leastRoundsToMoney);