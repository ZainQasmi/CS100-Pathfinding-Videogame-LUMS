%% Boundary conditions
    if position(1) < 0
        %         position(1) = 2000;
        shield_condition
    elseif position(1) > 2000
        %         position(1) = 0;
        shield_condition
    elseif position(2) < 0
        %         position(2) = 800;
        shield_condition
    elseif position(2) > 800
        %         position(2) = 0;
        shield_condition
    end
    
    %% WORMHOLE CONDITIONS
    
    if max(cShipX) >= 1600 && min(cShipX) <= 1650 && max(cShipY) >= 600 && min(cShipY) <= 650;
        if wormholeAUDIO == 0
        [y,fs]= audioread('teleportCROP0.mp3');
        TeleportMusik=audioplayer(y,fs);
        play(TeleportMusik)
        wormholeAUDIO = 1;
        end
        score = score + 10;
        position = [400 200];
        velocity = [0 0];
        wormholeIF
        wormholeXDATA = [125 275];
        wormholeYDATA = [125 275];
        wormholeIF
        set(wormholeText,'visible','on')
        pause(0.9)
        set(wormholeText,'visible','off')
    end
    
    %% PARTICLE SYSTEM CONDITION
    
    if max(cShipX) >= orbital1(1)+40 && min(cShipX) <= orbital1(3)+orbital1(1)+40 && max(cShipY) >= orbital1(2)+40 && min(cShipY) <= orbital1(2)+orbital1(4)+40
        shield_condition
    elseif max(cShipX) >= orbital2(1)+40 && min(cShipX) <= orbital2(3)+orbital2(1)+40 && max(cShipY) >= orbital2(2)+40 && min(cShipY) <= orbital2(2)+orbital2(4)+40
        shield_condition
    end
    
    %% MAZE PARTITION
    if max(cShipX) >= 0 && min(cShipX) <= 2000 && max(cShipY) >= 430 && min(cShipY) <= 460
        shield_condition
    end