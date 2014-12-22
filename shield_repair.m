if shieldup == 0
        if max(cShipX) >= repairX-10 & min(cShipX) <= repairX+80+10 & max(cShipY) >= repairY-10 & min(cShipY) <= repairY+80+10
repairAUDIO
set(repair1,'visible','off');
set(h_circ2,'visible','on');
set(h_circ,'visible','on');
score = score + 20;
shields = 3;
shieldup = 1;
velocity = [0 0];
set(repairText,'visible','on')
pause(0.5)
set(repairText,'visible','off')
end
    end