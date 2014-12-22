linAcc = linAcc.*0.1;
    angAcc = angAcc.*0.1;
    
    %update angle
    if angVel + angAcc <= 10 && angVel + angAcc >= -10
        angVel = angVel + angAcc;
        angle = angle + angVel;
    end
    %update velocity
    if norm(velocity) + linAcc <= 10.1
        velocity(1) = velocity(1) + (linAcc.*cosd(angle));
        velocity(2) = velocity(2) + (linAcc.*sind(angle));
    end
    %update position
    position = position + velocity;