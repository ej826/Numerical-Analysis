
%File similar to "bernstein.m" but only makes one graph out of the 10 points

%P = control points to form a heart
P = [0 1 1 1.5 2 0.5 1.5 -1 0 -1 0 -1 -1.5 -1 -2 0.5 -1 1.5 0 1];
clf;  %Clear figures

%Plot control points
for k=1:10
    plot(P(1,2*k-1),P(1,2*k),'r.','MarkerSize',20);
    hold on;
end

t = 0:.01:1;

% The cubic Bernstein basis functions
B=@(k,n,t) nchoosek(n,k)*(1-t).^(n-k).*t.^k;

B0 = B(0,9,t);
B1 = B(1,9,t);
B2 = B(2,9,t);
B3 = B(3,9,t);
B4 = B(4,9,t);
B5 = B(5,9,t);
B6 = B(6,9,t);
B7 = B(7,9,t);
B8 = B(8,9,t);
B9 = B(9,9,t);

% Multiplying the values of each point to their respective Bernstein function then summing them together
x= P(1,1) * B0  +  P(1,3) * B1  +  P(1,5) * B2  +  P(1,7) * B3 + P(1,9) * B4 + P(1,11) * B5 + P(1,13) * B6 + P(1,15) * B7 + P(1,17) * B8 + P(1,19) * B9;
y= P(1,2) * B0  +  P(1,4) * B1  +  P(1,6) * B2  +  P(1,8) * B3 + P(1,10) * B4 + P(1,12) * B5 + P(1,14) * B6 + P(1,16) * B7 + P(1,18) * B8 + P(1,20) * B9;

plot(x,y);   % Plot Bezier curve (x(t), y(t))
hold on;
