% exercise 4
clear all
close all
clc
%%
% schrittweiten
h1 = 0.2;
h2 = 0.1;
h3 = 0.05;
h4 = 0.025;
h5 = 0.0125;

% zeitvektoren
lim = 1;
t = linspace(0,lim,2000);
t1 = 0:h1:lim;
t2 = 0:h2:lim;
t3 = 0:h3:lim;
t4 = 0:h4:lim;
t5 = 0:h5:lim;

% anfangswert
y0 = 1;

% berechnung der ergebnisse
y =  1./(t + 1);
y1 = expl_euler('bspFun', t1, y0);
y2 = expl_euler('bspFun', t2, y0);
y3 = expl_euler('bspFun', t3, y0);
y4 = expl_euler('bspFun', t4, y0);
y5 = expl_euler('bspFun', t5, y0);

% plots
figure(1)
plot(t1,y1,'*-')
hold on
plot(t2,y2,'*-')
plot(t3,y3,'*-')
plot(t4,y4,'*-')
plot(t5,y5,'*-')
plot(t,y)
hold off

% Berechnung max. gobaler fehler
errorMat = zeros(3,5);
errorMat(1,:) = [h1,h2,h3,h4,h5];

for i = 1:length(errorMat)
    ithErr = -1;
    tmpMaxErrT = -1;
    tmpString1 = strcat('y',num2str(i));
    tmpString2 = strcat('t',num2str(i));
    curY = eval(tmpString1);
    curT = eval(tmpString2);
    for j = 1:length(curY)
        tmpT = curT(j);
        tmpIdx = find(t==tmpT);
        
        tmpErr = abs(curY(j)-y(tmpIdx));
        if tmpErr > ithErr
            ithErr = tmpErr;
            tmpMaxErrT = tmpT;
        end
    end
    errorMat(2,i) = ithErr;
    errorMat(3,i) = tmpMaxErrT;
end

disp(errorMat)

% max. globaler Fehler immer beim letzten Wert?