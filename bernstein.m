
P = [0 1 1 1.5 2 0.5 1.5 -1 0 -1; 0 -1 -1.5 -1 -2 0.5 -1 1.5 0 1];
clf;  %Clear figures

for m=1:2
%Plot control points
    for k=1:5
     plot(P(m,2*k-1),P(m,2*k),'r.','MarkerSize',20);
     hold on;
    end

    t = 0:.01:1;

    % The cubic Bernstein basis functions
    B=@(k,n,t) nchoosek(n,k)*(1-t).^(n-k).*t.^k;

    B0 = B(0,4,t);
    B1 = B(1,4,t);
    B2 = B(2,4,t);
    B3 = B(3,4,t);
    B4 = B(4,4,t);

    % Summing them together.
    x= P(m,1) * B0  +  P(m,3) * B1  +  P(m,5) * B2  +  P(m,7) * B3 + P(m,9) * B4;
    y= P(m,2) * B0  +  P(m,4) * B1  +  P(m,6) * B2  +  P(m,8) * B3 + P(m,10) * B4;

    plot(x,y);   % Plot Bezier curve (x(t), y(t))
    hold on;
end