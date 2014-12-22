function [ h_ship, h_circ, h_circ2 ] = makeSpaceShip( position, radius, angle)
theta_ship = [0 144 216];
x_ship = radius.*cosd(theta_ship+angle)+position(1);
y_ship = radius.*sind(theta_ship+angle)+position(2);
h_ship = fill(x_ship,y_ship,'red');
theta_circ = 0:359;
x_circ = radius.*cosd(theta_circ)+position(1);
y_circ = radius.*sind(theta_circ)+position(2);
h_circ = plot(x_circ,y_circ,'green');
h_circ2 = plot(x_circ,y_circ,'yellow');
end