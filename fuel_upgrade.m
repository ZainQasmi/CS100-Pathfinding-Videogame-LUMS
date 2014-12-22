    if fuelup == 0
        if max(cShipX) >= fuelX-10 & min(cShipX) <= fuelX+80+10 & max(cShipY) >= fuelY-10 & min(cShipY) <= fuelY+80+10
fuelupAUDIO
            set(fuel1,'visible','off');
            score = score + 20;
            fuel = fuel + 100;
            fuelup = 1;
            velocity = [0 0];
            set(fuelText,'visible','on')
            pause(0.5)
            set(fuelText,'visible','off')
            
                   end
    end