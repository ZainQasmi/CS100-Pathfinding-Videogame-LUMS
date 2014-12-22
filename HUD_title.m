
if shields == 1
    critshield = 'WARNING: SHIELDS CRITICAL !!!';
end

if fuelCAP ==0
    if fuel <= 20
        fuelAUDIO
        critshield = 'WARNING: FUEL CRITICAL !!!';
        fuelCAP = 1;
    end
end
fuel = fuel - 0.05;
fuelR = sprintf('%.0f',fuel);
if fuel <= 0
    warndlg('Be patient but dont wait forever!', 'Out of Fuel', 'modal');
    done = 1;
end
%% TITLE DISPLAY
title(['Score = ',num2str(score),'    ','Fuel = ',num2str(fuelR),' ','litres','    ','Shields = ',num2str(shields-1),'    ',num2str(critshield),'    ',num2str(critfuel)],'Color','red','FontWeight','bold');
