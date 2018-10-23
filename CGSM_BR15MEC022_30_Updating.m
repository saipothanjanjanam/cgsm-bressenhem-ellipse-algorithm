%To close any previous process
clear all;
close all;
clc
%Major and Minor axis for an ellipse
majoraxis = input('majoraxis:');
a = majoraxis/2;
minoraxis = input('minoraxis:');
b = minoraxis/2;
%Centre
cx = input('xcordinate of centre:');
cy = input('ycordinate of centre:');
%Initial Condition parameter for first region
p01 = (b^2) - ((a^2)*b) + ((a^2)/4);
pk = p01;
%First pixel
x = 0;
y = b;
%Matrices for storing X, Y and pk values
xcor(1) = x;
ycor(1) = y;
i = 1;
arrpk(1) = p01;

%For First Region

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

%For Second Region
p02 = (b^2)*(xcor(i)+0.5)^2 + (a^2)*(ycor(i)-1)^2 - (a^2)*(b^2);  
pk = p02;
while (b^2)*x > (a^2)*y
    if y == 0
        break
    end
    if pk>0
        x = x;
        y = y - 1;
        xcor(i+1) = x;
        ycor(i+1) = y;
        pk2 = pk - 2*(a^2)*y + a^2;
        pk = pk2;
    else
        x = x + 1;
        y = y - 1;
        xcor(i+1) = x;
        ycor(i+1) = y;
        pk2 = pk + 2*(b^2)*x - 2*(a^2)*y + a^2;
        pk = pk2;
    end
    i = i + 1;
    arrpk(i+1) = pk;
end

%Plotting Result
hold on
axis([-a-2+cx a+2+cx -b-2+cy b+2+cy])
plot(xcor+cx,ycor+cy,'s','MarkerSize',12,...
    'MarkerEdgeColor','black',...
    'MarkerFaceColor',[0 0 0]);
plot(-xcor+cx,ycor+cy,'s','MarkerSize',12,...
    'MarkerEdgeColor','black',...
    'MarkerFaceColor',[0 0 0])
plot(-xcor+cx,-ycor+cy,'s','MarkerSize',12,...
    'MarkerEdgeColor','black',...
    'MarkerFaceColor',[0 0 0])
plot(xcor+cx,-ycor+cy,'s','MarkerSize',12,...
    'MarkerEdgeColor','black',...
    'MarkerFaceColor',[0 0 0])
plot(cx,cy,'*','MarkerSize',12,...
    'MarkerEdgeColor','black',...
    'MarkerFaceColor',[0 0 0])
grid on

