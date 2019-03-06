%% script for creating a robotic arm

% See http://www.petercorke.com/RTB/r9/html/SerialLink.html for more
% instructions.

% Our 4-DoF robot arm consists of the following joints:
%  - waist
%  - shoulder
%  - elbow
%  - neck

%% setup robot parameters
robotName         = 'Terminator T1000';
robotManufacturer = 'LIRS';

% Denavit-Hartenberg's parameters
% which describe the relationship between the links of the manipulator

a = [10 30 40 0]; % link lengths

d = [0 0 -10 10]; % offsets

alpha = [pi/2 0 0 0]; % twist angles


%% create links

% each link is represented by a revolute joint
% 'links' - is an array
links(1) = Revolute('d', d(1), 'a', a(1), 'alpha', alpha(1));
links(2) = Revolute('d', d(2), 'a', a(2), 'alpha', alpha(2));
links(3) = Revolute('d', d(3), 'a', a(3), 'alpha', alpha(3));
links(4) = Revolute('d', d(4), 'a', a(4), 'alpha', alpha(4));
 
links(1).name = 'waist';
links(2).name = 'shoulder';
links(3).name = 'elbow';
links(4).name = 'neck';

%% create a model of our robot
robot = SerialLink(links, 'name', robotName);
robot.manufacturer = robotManufacturer;


%% plot the robot arm
joint_angles = [0 0 0 0];
robot.plot(joint_angles, 'tilesize', 50);


%% animate the robot arm

% specify initial and final joint angles
S = [0 0 0 0];
E = deg2rad([30 120 120 180]);

% generate a set of joint angles from S to E
Q = mtraj(@tpoly, S, E, 50);

robot.plot(Q, 'delay', 0.033, 'tilesize', 50, 'movie', 'animation');
