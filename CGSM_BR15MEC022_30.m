clear all;
close all;
clc
majoraxis = input('majoraxis:');
a = majoraxis/2;
minoraxis = input('minoraxis:');
b = minoraxis/2;
p01 = (b^2) - ((a^2)*b) + ((a^2)/4);
pk = p01;
x = 0;
y = b;
xcor(1) = x;
ycor(1) = y;
i = 1;
arrpk(i) = p01;
while  (b^2)*x < (a^2)*y 
    if pk<0
        x = x + 1;
        y = y;
        xcor(i+1) = x;
        ycor(i+1) = y;
        pk1 = pk + 2*(b^2)*x + b^2;
        pk = pk1;
    else
        x = x + 1;
        y = y - 1;
        xcor(i+1) = x;
        ycor(i+1) = y;
        pk1 = pk + 2*(b^2)*x + b^2 - 2*(a^2)*y;
        pk = pk1;
    end
    i = i + 1;
    arrpk(i+1) = pk;
end










plot(xcor,ycor,'s','MarkerSize',12,...
    'MarkerEdgeColor','black',...
    'MarkerFaceColor',[0 0 0]);
axis([-a-2 a+2 -b-2 b+2])
hold on
plot(-xcor,ycor,'s','MarkerSize',12,...
    'MarkerEdgeColor','black',...
    'MarkerFaceColor',[0 0 0])
plot(-xcor,-ycor,'s','MarkerSize',12,...
    'MarkerEdgeColor','black',...
    'MarkerFaceColor',[0 0 0])
plot(xcor,-ycor,'s','MarkerSize',12,...
    'MarkerEdgeColor','black',...
    'MarkerFaceColor',[0 0 0])
grid on

