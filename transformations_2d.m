%% create the 2D transformation

% translation along X and Y axes for (1, 2) and rotation to 30 degrees
T1 = SE2(1, 2, deg2rad(30)) % note that angle is specified in radians

% or you can use an alternative variant:

% speicfy angle in degrees
% T1 = SE2(1, 2, 30, 'deg')


%% plot 2D transformation

% try to change the frame's name and its color
trplot2(T1, 'frame', '1', 'color', 'b', 'axis', [0, 5, 0, 5]);

% trplot2(T1, 'frame', 'World', 'color', 'k', 'axis', [0, 5, 0, 5]);

%% create another 2D transformation

% displacement of (2, 1) along X and Y axes, no rotation
T2 = SE2(2, 1, 0)


%% plot T1 and T2 in one figure

% setup axis parameters
axis([0 5 0 5]);
axis square;

% use created figure to plot on it, do not create a new one
hold on;

trplot2(T1, 'frame', '1', 'color', 'b');
trplot2(T2, 'frame', '2', 'color', 'r');

hold off;

% now, try to comment 'hold on' and 'hold off' commands
% what do you see? => only the T2 is plotted

%% compose T1 and T2 - super transformation combo x2

% that's how 2 transformations are composed together
T3 = T1 * T2

% plot T1, T2, and T3 in one figure
axis([0 5 0 5]);
axis square;

grid on; % enabled the grid
hold on;

trplot2(T1, 'frame', '1', 'color', 'b');
trplot2(T2, 'frame', '2', 'color', 'r');
trplot2(T3, 'frame', '3', 'color', 'g');

hold off;


%% compose T2 and T1 - order is changed 

% let's see, what we get when the order of composition is changed
T4 = T2 * T1

% see the result? compare it with T3 = T1 * T2
% => composition of transformations is not commutative

% plot T1, T2, T3, and T4 in one figure
axis([0 5 0 5]);
axis square;

grid on;
hold on;

trplot2(T1, 'frame', '1', 'color', 'b');
trplot2(T2, 'frame', '2', 'color', 'r');
trplot2(T3, 'frame', '3', 'color', 'g');
trplot2(T4, 'frame', '4', 'color', 'c');

hold off;


%% create and draw a point P

% define a 2D point (a column vector)
P = [3; 2]

axis([0 5 0 5]);
axis square;

grid on;
hold on;

trplot2(T1, 'frame', '1', 'color', 'b');
trplot2(T2, 'frame', '2', 'color', 'r');
trplot2(T3, 'frame', '3', 'color', 'g');
trplot2(T4, 'frame', '4', 'color', 'c');

% a point with a color - k (black), label - 'P', and denoted as '*'
plot_point(P, 'k*', 'label', 'P')

hold off;


%% compute the coordinates of point P in the {1} coordinate frame, T1

% Question: why can we find an inverse of T1? Can we always do it for a 3x3 matrix?

P1 = inv(T1) * P

% or try it this way (returns homogeneous representation)
% P1 = double(inv(T1)) * [P; 1]
% P1 = double(inv(T1)) * e2h(P)

% to get back to Euclidean representation
% P1 = h2e(P1)

% apply homogeneous tranformation to the point P
% P1 = homtrans(double(inv(T1)), P)

% or to multiple points
Pts = [P P P P P P P];
homtrans(double(inv(T1)), Pts)