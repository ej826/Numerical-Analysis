%Author: Emily Justus

%This program will be a demonstration of the output of the Random Walk on
%Trees idea, which states that a ball will start on n on the y-axis. Then for
%every iteration it will drop down once on the y-axis, but it has a 50% chance of
%moving right or left on the x-axis. The ball will continue to move down
%until n = 0. This entire process is repreated k amount of times to get the
%probability of where the ball will land when n = 0.

k = 100000;
mat = zeros(1,101);

for i = 1:k
    n = 50;
    x = 0;
    while n > 0
        rand_value = randi([0 1]);
        if rand_value == 0
            x = x - 1;
        else
            x = x + 1;
        end
        n = n - 1;
    end
    mat_ind = x + 51;
    mat(mat_ind) = mat(mat_ind) + (1/k);
end

x = -50:1:50;
bar(x,mat);
title('Random Walk on Trees');
ylabel('Probability');
xlabel('Position');