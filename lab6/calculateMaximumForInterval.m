function M = calculateMaximumForInterval(func,interval)
    xInterval = interval;
%specify resolution of the evaluation
dx = 0.01;
%Create a vector of x values based on the interval of evaluateion and
%resolution specifications
x = xInterval(1): dx : xInterval(2);
%Calculate f(x) values
for i = 1:length(x)
%fx(i) = sin(5*cos(x(i)))*cos(5*sin(x(i)));
fx(i) = func(x(i));
end
%Find the magnitude and index of the maximum f(x) value and print the
%maximum magnitude to the command window
[M,idx] = max(fx);
%fprintf('The maximum value in the given range of x is: %5.4f\n',M)
%Use the index of the maximum f(x) value to find the x value which produced
%the maximum f(x) value
%xForMaxFx = x(idx);
end