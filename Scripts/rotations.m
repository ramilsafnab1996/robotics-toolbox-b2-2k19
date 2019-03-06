%% create a 3D rotation matrix
clear;

% rotation around Z-axis for 30 degrees
Rz = rotz(30)

%% plotting and animating rotations

% figure - plot in separate figures
figure, trplot(Rz);

% plot the reference frame along with the rotated one
%{
hold on;
trplot(eye(3), 'frame', 'o', 'color', 'black');
hold off;
%}

% animate the rotation around Z-axis
figure, tranimate(Rz);

%% composing rotations - super rotations x2

% rotations are not commutative (i.e. order matters)
% so if a frame is rotated for 90 degrees around X and Y
% it is not the same as if a frame is rotated for 90 degress around Y and X
trplot(rotx(90) * roty(90), 'frame', '1', 'color', 'b');

hold on;

trplot(roty(90) * rotx(90), 'frame', '2', 'color', 'r');

axis square;
hold off;

%% create a rotation matrix using euler angles (ZYZ)

% rotation around Z and Y for 30 and 60 degrees, respectively
Rzyz = eul2r(90, 180, 0)

% an alternative rotation matrix
% Rzyz = rotz(90) * roty(180) * rotz(0)

trplot(Rzyz, 'frame', '1', 'color', 'b');

% plot the reference frame
%{
hold on
trplot(eye(3), 'frame', 'o', 'color', 'black')
axis equal
hold off;
%}

%% convert a rotation matrix to euler angles

% rotation around X, Y, and Z axes for 90 degrees
Rxyz = rotx(90) * roty(90) * rotz(90)

zyz_angles = rad2deg(tr2eul(Rxyz))

% let's check the correctness of the found euler angles

trplot(Rzyz, 'frame', 'xyz', 'color', 'r');
hold on;
trplot(eul2r(zyz_angles), 'frame', 'zyz', 'color', 'b');

axis equal;
hold off;


%% create a rotation matrix using roll-pitch-yaw

RPY = rpy2r(60, 45, 0)

trplot(RPY, 'frame', '1', 'color', 'g');

hold on;

trplot(eye(3), 'frame', 'o', 'color', 'black')
axis equal

hold off;
