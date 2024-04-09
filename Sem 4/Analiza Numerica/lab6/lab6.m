% 1.
% % Given data points
% time = [9, 10, 11, 12, 13, 14, 15]; % time
% temperature = [12, 10, 8, 11, 15, 17, 13]; % temperature
% 
% % Perform linear least squares fitting
% A = [time', ones(length(time), 1)];
% coefficients = A \ temperature'; % Coefficients: [a; b]
% 
% % Predict temperature at x = 16
% x_predict = 16;
% temperature_predict = coefficients(1) * x_predict + coefficients(2);
% 
% % Calculate the minimum value E(a, b)
% error = sum((A * coefficients - temperature').^2);
% 
% % Display the results
% fprintf('Linear least squares function: f(x) = %.4fx + %.4f\n', coefficients(1), coefficients(2));
% fprintf('Predicted temperature at 16:00: %.2f\n', temperature_predict);
% fprintf('Minimum value E(a, b): %.4f\n', error);
% 
% % Plot the points and the least squares function
% figure;
% scatter(time, temperature, 100, 'r', 'filled');
% hold on;
% x_interval = linspace(min(time), max(time), 100);
% y_least_squares = coefficients(1) * x_interval + coefficients(2);
% plot(x_interval, y_least_squares, 'b-', 'LineWidth', 2);
% xlabel('Time');
% ylabel('Temperature');
% title('Linear Least Squares Fitting');
% legend('Data Points', 'Least Squares Function', 'Location', 'best');
% grid on;
% hold off;

% 2.
% % Given data points
% altitude = [0, 500, 1000, 2500, 5000, 8500]; % altitude (m)
% oxygen = [20.9, 19.6, 18.4, 15.3, 11.2, 7.2]; % oxygen concentration (%)
% 
% % Degrees of polynomials for least square approximations
% degrees = [2, 3]; % Two different degrees of polynomials
% 
% % Altitude values to predict oxygen concentration
% altitude_predict = [753, 600];
% 
% % Oxygen concentration at Kilimanjaro (6000m)
% oxygen_kilimanjaro = 9.9;
% 
% % Initialize arrays to store approximation results
% oxygen_predictions = zeros(length(altitude_predict), length(degrees));
% approximation_errors = zeros(1, length(degrees));
% 
% % Perform least square approximations for different degrees of polynomials
% figure;
% scatter(altitude, oxygen, 100, 'r', 'filled');
% hold on;
% for i = 1:length(degrees)
%     % Obtain polynomial coefficients
%     coefficients = polyfit(altitude, oxygen, degrees(i));
% 
%     % Predict oxygen concentration at given altitudes
%     oxygen_predictions(:, i) = polyval(coefficients, altitude_predict);
% 
%     % Compute approximation error at 6000m
%     oxygen_approx_kilimanjaro = polyval(coefficients, 6000);
%     approximation_errors(i) = abs(oxygen_approx_kilimanjaro - oxygen_kilimanjaro);
% 
%     % Plot the interpolation polynomials
%     x_interval = linspace(min(altitude), max(altitude), 100);
%     y_polynomial = polyval(coefficients, x_interval);
%     plot(x_interval, y_polynomial, 'LineWidth', 2);
% end
% 
% % Add labels and legend
% xlabel('Altitude (m)');
% ylabel('Oxygen Concentration (%)');
% title('Least Square Approximations');
% legend('Interpolation Points', '2nd Degree Polynomial', '3rd Degree Polynomial', 'Location', 'best');
% grid on;
% hold off;
% 
% % Display the results
% fprintf('Predicted oxygen concentration at 753m:\n');
% disp(oxygen_predictions(1, :));
% fprintf('Predicted oxygen concentration at 600m:\n');
% disp(oxygen_predictions(2, :));
% fprintf('Approximation errors at 6000m:\n');
% disp(approximation_errors);

% 3.
% Prompt the user to select 10 random points
disp('Please select 10 random points in the plot window.');
points = ginput(10);

% Extract x and y coordinates of selected points
x_points = points(:, 1);
y_points = points(:, 2);

% Perform least squares fitting for a 2nd degree polynomial
coefficients = polyfit(x_points, y_points, 2);

% Generate x values for plotting
x_values = linspace(0, 5, 100);

% Evaluate the polynomial at x values
y_values = polyval(coefficients, x_values);

% Plot the selected points
scatter(x_points, y_points, 100, 'r', 'filled');
hold on;

% Plot the least squares polynomial
plot(x_values, y_values, 'b-', 'LineWidth', 2);

xlabel('x');
ylabel('y');
title('Least Squares Polynomial Fitting');
legend('Selected Points', 'Least Squares Polynomial', 'Location', 'best');
grid on;
hold off;
