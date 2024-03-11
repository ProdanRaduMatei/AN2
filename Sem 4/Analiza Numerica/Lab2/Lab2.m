% 1.
% f : [a, b] -> R
% xi apartine [a, b] nodes
% f(xi) = y, i = 1,m
% (Lmf)(x) = (SUM(Ai * f(xi) * y))/ (SUM(Ai/(x - xi)
% Ai = 1/(PROD(xi - xj)

% x = [1960, 1970, 1980, 1990, 2000, 2010, 2020];
% y = [18458008, 19922618, 22125224, 22836234, 21919876, 20335211, 19442038];
% plot(x, y, '*');
% z = [1974, 2005, 2035];
% ans_z = Lagrange(z, x, y);
% fprintf('1974-%8.3f', ans_z(3));
% hold on;
% t = 1960:1:2020;
% plot(t, Lagrange(t, x, y)); %aproximate the population from 1960 until 2020

% 2.
% f(x) = sqrt(x)
% x = [144, 169, 196];
% y = [12, 13, 14];
% z = 153;
% ans_z = Lagrange(z, x, y)

% 3.
% x = 0:0.01:20;
% f = (2 + sin(3 * pi * x)) ./ (1 + x .^ 2);
% plot(x, f, 'r--');
% hold on;
% x_nodes = linspace(0, 20, 24);
% f_nodes = (2 + sin(3 * pi * x_nodes)) ./ (1 + x_nodes .^ 2);
% fL = Lagrange(x, x_nodes, f_nodes);
% plot(x, fL, 'b');

% 4.
x = 1:1:14;
f = (3 * tan(x .^ 2)) ./ (x .^ 2 + 2);
plot(x, f, 'r--');
hold on;
x_nodes = linspace(1, 14);
f_nodes = (3 * tan(x_nodes .^ 2)) ./ (x_nodes .^ 2 + 2);
fL = Lagrange(x, x_nodes, f_nodes);
plot(x, fL, 'b');