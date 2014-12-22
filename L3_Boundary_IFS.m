%% Boundary conditions
    if position(1) < 0
        position(1) = 2184;
    elseif position(1) > 2184
        position(1) = 0;
    elseif position(2) < 0
        position(2) = 1472;
    elseif position(2) > 1472
        position(2) = 0;
    end
    
    %% MAZE WALLS
    if max(cShipX) >= 0 && min(cShipX) <= 60 && max(cShipY) >= 340 && min(cShipY) <= 780
        shield_condition
    elseif max(cShipX) >= 50 && min(cShipX) <= 1000 && max(cShipY) >= 0 && min(cShipY) <= 60
        shield_condition
    elseif max(cShipX) >= 0 && min(cShipX) <= 1020 && max(cShipY) >= 1460 && min(cShipY) <= 1500
        shield_condition
    elseif max(cShipX) >= 1000 && min(cShipX) <= 1050 && max(cShipY) >= 0 && min(cShipY) <= 1600
        shield_condition
    elseif max(cShipX) >= 0 && min(cShipX) <= 540 && max(cShipY) >= 750 && min(cShipY) <= 800
        shield_condition
    elseif max(cShipX) >= 540 && min(cShipX) <= 570 && max(cShipY) >= 750 && min(cShipY) <= 1000
        shield_condition
    elseif max(cShipX) >= 0 && min(cShipX) <= 60 && max(cShipY) >= 1150 && min(cShipY) <= 1800
        shield_condition
    elseif max(cShipX) >= 1500 && min(cShipX) <= 1550 && max(cShipY) >= 450 && min(cShipY) <= 2000
        shield_condition
    elseif max(cShipX) >= 1850 && min(cShipX) <= 1900 && max(cShipY) >= 0 && min(cShipY) <= 1150
        shield_condition
    elseif max(cShipX) >= 1900 && min(cShipX) <= 2200 && max(cShipY) >= 450 && min(cShipY) <= 500
        shield_condition
        % OBSTACLES
    elseif max(cShipX)-25 >= cObs1(1) && min(cShipX) <= (cObs1(1)+cObs1(3))+50 && max(cShipY)-25 >= cObs1(2) && min(cShipY) <= (cObs1(2)+cObs1(4))+25;
        shield_condition
        % OBSTACLES CRAFT
    elseif max(cShipX) >= min(cX1)+40 && min(cShipX) <= max(cX1)+40 && max(cShipY) >= min(cY1)+40 && min(cShipY) <= max(cY1)+40
        shield_condition
    elseif max(cShipX) >= min(cX2)+40 && min(cShipX) <= max(cX2)+40 && max(cShipY) >= min(cY2)+40 && min(cShipY) <= max(cY2)+40
        shield_condition
    elseif max(cShipX) >= min(cX3)+40 && min(cShipX) <= max(cX3)+40 && max(cShipY) >= min(cY3)+40 && min(cShipY) <= max(cY3)+40
        shield_condition
        % GATE
    elseif max(cShipX) >= 1050 && min(cShipX) <= 1050+gate1Width && max(cShipY) >= 1050 && min(cShipY) <= 1150
        shield_condition
        % GATE 2
    elseif max(cShipX) >= (1500-gate2Width) && min(cShipX) <= (1500) && max(cShipY) >= 1050 && min(cShipY) <= 1150
        shield_condition
        % SUN
    elseif max(cShipX) >= 500 && min(cShipX) <= 590 && max(cShipY) >= 1080 && min(cShipY) <= 1160
        velocity = velocity + 50;
        slingshotDLG = warndlg('The star"s gravity slingshotted your ship into outerspace', 'Hahaha', 'modal');
    end