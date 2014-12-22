%% Boundary conditions
    if position(1) < 0
        %         position(1) = 800;
        shield_condition
    elseif position(1) > 800
        %         position(1) = 0;
        shield_condition
    elseif position(2) < 0
        %         position(2) = 2000;
        shield_condition
    elseif position(2) > 2000
        %         position(2) = 0;
        shield_condition
    end
    
    %% MAZE WALLS
    if max(cShipX) >= 40 && min(cShipX) <= 640 && max(cShipY) >= 340 && min(cShipY) <= 380
        shield_condition
    elseif max(cShipX) >= 240 && min(cShipX) <= 880 && max(cShipY) >= 640 && min(cShipY) <= 680
        shield_condition
    elseif max(cShipX) >= 40 && min(cShipX) <= 340 && max(cShipY) >= 940 && min(cShipY) <= 980
        shield_condition
    elseif max(cShipX) >= 540 && min(cShipX) <= 840 && max(cShipY) >= 940 && min(cShipY) <= 980
        shield_condition
        % GATES
    elseif max(cShipX) >= 565 && min(cShipX) <= 605 && max(cShipY) >= 690 && min(cShipY) <= 690+gate1Height
        shield_condition
    elseif max(cShipX) >= 100+gate2Height+40 && min(cShipX) <= 100+gate2Height+40+40 && max(cShipY) >= 340+40 && min(cShipY) <= 340+gate2Height+40
        shield_condition
    elseif max(cShipX) >= 225+40 && min(cShipX) <= 225+40+40 && max(cShipY) >= 900-gate2Height+40 && min(cShipY) <= gate2Height+40+900-gate2Height
        shield_condition
        % PLANET COLLISIONS
    elseif max(cShipX) >= sun1(1)+40 && min(cShipX) <= sun1(3)+sun1(1)+40 && max(cShipY) >= sun1(2)+40 && min(cShipY) <= sun1(2)+sun1(4)+40
        shield_condition
    elseif max(cShipX) >= orbit1(1)+40 && min(cShipX) <= orbit1(3)+orbit1(1)+40 && max(cShipY) >= orbit1(2)+40 && min(cShipY) <= orbit1(2)+orbit1(4)+40
        shield_condition
    elseif max(cShipX) >= orbit2(1)+40 && min(cShipX) <= orbit2(3)+orbit2(1)+40 && max(cShipY) >= orbit2(2)+40 && min(cShipY) <= orbit2(2)+orbit2(4)+40
        shield_condition
    elseif max(cShipX) >= orbit3(1)+40 && min(cShipX) <= orbit3(3)+orbit3(1)+40 && max(cShipY) >= orbit3(2)+40 && min(cShipY) <= orbit3(2)+orbit3(4)+40
        shield_condition
    end