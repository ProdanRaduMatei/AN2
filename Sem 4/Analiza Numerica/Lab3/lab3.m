% 1.
% % Given data
% x = [1.2, 1.6, 2, 2.4, 3.1, 4];
% lg_x = [0.07918, 0.20412, 0.30103, 0.38021, 0.49136, 0.60206];
% 
% % Points to interpolate
% x_interpolate = [2.5, 3.26];
% 
% % Calculate divided differences
% n = length(x);
% F = zeros(n, n);
% F(:,1) = lg_x';
% 
% for j = 2:n
%     for i = j:n
%         F(i,j) = (F(i,j-1) - F(i-1,j-1)) / (x(i) - x(i-j+1));
%     end
% end
% 
% % Compute the interpolated values
% lg_interpolated = zeros(size(x_interpolate));
% for k = 1:length(x_interpolate)
%     sum = F(1,1);
%     for i = 2:n
%         prod = 1;
%         for j = 1:i-1
%             prod = prod * (x_interpolate(k) - x(j));
%         end
%         sum = sum + F(i,i) * prod;
%     end
%     lg_interpolated(k) = sum;
% end
% 
% % Display the interpolated values and compare with given values
% disp('Interpolated values:');
% disp(['lg(2.5) = ', num2str(lg_interpolated(1))]);
% disp(['lg(3.26) = ', num2str(lg_interpolated(2))]);
% 
% % Compare with given values
% lg_given = [0.39794, 0.5132176];
% error = abs(lg_interpolated - lg_given);
% disp('Absolute errors:');
% disp(['Error for lg(2.5) = ', num2str(error(1))]);
% disp(['Error for lg(3.26) = ', num2str(error(2))]);
% 
% % Evaluate the interpolation polynomial for plotting
% t_values = linspace(min(x), max(x), 100);
% lg_values = zeros(size(t_values));
% for k = 1:length(t_values)
%     t = t_values(k);
%     poly_newton = F(1,1);
%     for i = 2:n
%         prod = 1;
%         for j = 1:i-1
%             prod = prod * (t - x(j));
%         end
%         poly_newton = poly_newton + F(i,i) * prod;
%     end
%     lg_values(k) = poly_newton;
% end
% 
% % Plot the data points and the interpolation polynomial
% figure;
% hold on;
% plot(x, lg_x, 'ro', 'MarkerSize', 8); % Data points
% plot(t_values, lg_values, 'b-', 'LineWidth', 1.5); % Interpolation polynomial
% xlabel('x');
% ylabel('lg(x)');
% title('Newton Interpolation Polynomial');
% legend('Data Points', 'Interpolation Polynomial');
% grid on;
% hold off;
% 
% % Define the Newton interpolation polynomial function
% N_mf = @(x) F(1,1);
% for i = 2:n
%     prod = 1;
%     for j = 1:i-1
%         prod = prod .* (x - x(j));
%     end
%     N_mf = @(x) N_mf(x) + F(i,i) * prod;
% end
% 
% % Define f(y) = lg(y)
% f_y = @(y) log10(y);
% 
% % Estimate the maximum interpolation error
% max_error = 0;
% for i = 10:30
%     y_i = i / 10;
%     lg_y_i = f_y(y_i);
%     N_mf_x_i = N_mf(y_i);
%     error = abs(lg_y_i - N_mf_x_i);
%     if error > max_error
%         max_error = error;
%     end
% end
% 
% disp(['Maximum interpolation error: ', num2str(max_error)]);

% 2.
% Given data
Points = [1, 2, 3, 4, 5];
Students = [30, 26, 22, 32, 28];
% Point to interpolate
point_interpolate = 3.5;

% Calculate divided differences
n = length(Points);
F = zeros(n, n);
F(:,1) = Students';

for j = 2:n
    for i = j:n
        F(i,j) = (F(i,j-1) - F(i-1,j-1)) / (Points(i) - Points(i-j+1));
    end
end

% Define the Newton interpolation polynomial
N_mf = @(x) F(1,1);
for i = 2:n
    prod = 1;
    for j = 1:i-1
        prod = prod .* (x - Points(j));
    end
    N_mf = @(x) N_mf(x) + F(i,i) * prod;
end

% Evaluate the interpolation polynomial for 3.5 points
students_3_5 = N_mf(point_interpolate);

disp(['Expected number of students with 3.5 points: ', num2str(students_3_5)]);

% Plot the data points and the interpolation polynomial
figure;
hold on;
plot(Points, Students, 'ro', 'MarkerSize', 8); % Data points
x_values = linspace(min(Points), max(Points), 100);
y_values = zeros(size(x_values));
for i = 1:length(x_values)
    y_values(i) = N_mf(x_values(i));
end
plot(x_values, y_values, 'b-', 'LineWidth', 1.5); % Interpolation polynomial
xlabel('Points');
ylabel('Students');
title('Newton Interpolation Polynomial');
legend('Data Points', 'Interpolation Polynomial');
grid on;
hold off;

