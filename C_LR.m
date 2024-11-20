clc;
clear all;


% Define the equation
syms x1 x2;
f(x1, x2) = -cos(x1) * cos(x2) * exp(-(x1 - pi) ^ 2 - (x2 - pi) ^ 2);

% plot the contour plot
fcontour(f, 'Fill', 'on');
% To show the color bar next to the plot
colorbar
% For 3d plot //// I just coment it because it doesn't look good
% fsurf(f);
% To hold the plot so we can show the update of point on it
hold on

% Initial point given by homework
% x = [0.75; -1.25];
% x = [0; 0];
x = [3.5; 3.5];

% Learing Rate (alpha)
learningRate = SWC(transpose(x), f);
% learningRate = GOLD(transpose(x), f);
% learningRate = BT(transpose(x), f);

% Gradient function
gStar = gradient(f);

% Gradient in initial point
gi = double(subs(gStar(x(1), x(2)),{x1,x2},{x(1),x(2)}));
p = -gi;

% Two empty list to save the points during the update
x1List = [x(1)];
x2List = [x(2)];

for i = 1:1000
    % Update the point
    x = x + learningRate * p;

    % Save the points inside the empty list for further use
    x1List = [x1List x(1, 1)]; %#ok
    x2List = [x2List x(2, 1)]; %#ok

    % Compute the next gradient with new point
    gii = double(subs(gStar(x(1), x(2)),{x1,x2},{x(1),x(2)}));

    % compute the Beta
    beta = (transpose(gii) * (gii - gi)) / (norm(gi) ^ 2);
    
    % Update the p value
    p = -gii + beta * p;

    % Replace the new gradient value as old value
    gi = gii;

    % Break the iteration
    % Check if the points don't change more than 10e-4 and if so break
    errorAmountx1 = x1List(1, i)  - x(1, 1);
    errorAmountx2 = x2List(1, i)  - x(2, 1);
    if (errorAmountx1 < 10e-4 && errorAmountx2 < 10e-4)
        break
    end
    % Learing Rate (alpha)
    % learningRate = SWC(transpose(x), f);
    % learningRate = GOLD(transpose(x), f);
    % learningRate = BT(transpose(x), f);
end

% After finding the min point print out the results
disp('Iteration = ');
disp(i);
disp('The Min Point = ');
disp(x);
disp('Final x in equation : ')
fResult = double(subs(f(x(1,1), x(2,1)),{x1,x2},{x(1,1),x(2,1)}));
disp(fResult);
plot(x1List, x2List, 'r-*');