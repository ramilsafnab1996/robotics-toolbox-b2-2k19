%% create a 3D transformation (translation)
clear;

% define a translation vector [x; y; z]
t = [1; 3; 5]

% create a correspandant homogeneous matrix
T = transl(t)

%% apply translation to a 3D point

% define a 3D point (column vector)
P = [1; 1; 1]

% translate the point
P1 = P + t

% or we can apply our homogeneous tranformation
P1 = h2e(T * e2h(P))

%% plot the point before and after translation

axis([0 5 0 5 0 10]);

grid on;
hold on;

axis square;

plot3(P(1), P(2), P(3), '*', 'color', 'b');
plot3(P1(1), P1(2), P1(3), '*', 'color', 'g');

text(P(1) - 0.3, P(2) - 0.3, P(3), 'P');
text(P1(1) - 0.3, P1(2) - 0.3, P1(3), 'P1');

xlabel('x'), ylabel('y'), zlabel('z');

hold off;


%% create a 3D transformation (rotation)

% create a rotation matrix
Rz = rotz(90)

% create a correspondant homogeneous matrix
T = rotm2tform(Rz)

%% apply rotation on a point

P = [1; 2; 0]

% rotate the point around Z and Y
P1 = Rz * P

% or, alternatively, apply a homogeneous transformation
P1 = h2e(T * e2h(P))

%% plot the point before and after rotation

axis([-5 5 -5 5 0 5]);

grid on;
hold on;

axis square;

plot3(P(1), P(2), P(3), '*', 'color', 'b');
plot3(P1(1), P1(2), P1(3), '*', 'color', 'g');

text(P(1) - 0.3, P(2) - 0.3, P(3), 'P');
text(P1(1) - 0.3, P1(2) - 0.3, P1(3), 'P1');

xlabel('x'), ylabel('y'), zlabel('z');

hold off;


%% create a 3D transformation (translation and rotation)
R = eul2r(30, 60, 0);
t = [3; 4; 1];

T = [[R; zeros(1,3)] [t; 1]]

% plot the transformation
trplot(T, 'frame', 'T', 'color', 'b');
