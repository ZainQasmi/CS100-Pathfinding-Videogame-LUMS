function [h_ship, h_circ, h_circ2] = ShipNav(h_ship, h_circ, h_circ2, position, angle, radius)
    
theta_ship = [0 144 216];
theta_circ = 0:359;
theta = [0 90 180 270];
%     x = 20.*cosd(theta+angle)+position(1);
%     y = 20.*sind(theta+angle)+position(2);
    x_ship = radius.*cosd(theta_ship+angle)+position(1);
    y_ship = radius.*sind(theta_ship+angle)+position(2);
    
    x_circ = radius.*cosd(theta_circ)+position(1);
    y_circ = radius.*sind(theta_circ)+position(2);
    
    x_circ2 = 1.5.*radius.*cosd(theta_circ)+position(1);
    y_circ2 = 1.5.*radius.*sind(theta_circ)+position(2);
    
    set(h_ship,'Xdata',x_ship,'Ydata',y_ship,'facecolor',rand(1,3))
    set(h_circ,'Xdata',x_circ,'Ydata',y_circ)
    set(h_circ2,'Xdata',x_circ2,'Ydata',y_circ2)

end

