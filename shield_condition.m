velocity = -velocity;

if shields~=1
hitAUDIO
end
     
set(h_circ2,'visible','off');
shields = shields - 1;
if shields == 1
    set(h_circ,'visible','off');
end
if shields == 0;
    set(h_ship,'visible','off')
    
    set(SS1,'Xdata',[x-80 x+80],'Ydata',[y-80 y+80],'visible','on')
    pause(0.02)
    set(SS2,'Xdata',[x-80 x+80],'Ydata',[y-80 y+80],'visible','on')
    pause(0.02)
    set(SS3,'Xdata',[x-80 x+80],'Ydata',[y-80 y+80],'visible','on')
    pause(0.02)
    set(SS4,'Xdata',[x-80 x+80],'Ydata',[y-80 y+80],'visible','on')
    pause(0.02)
    set(SS5,'Xdata',[x-80 x+80],'Ydata',[y-80 y+80],'visible','on')
    pause(0.02)
    set(SS6,'Xdata',[x-80 x+80],'Ydata',[y-80 y+80],'visible','on')
    pause(0.02)
    set(SS7,'Xdata',[x-80 x+80],'Ydata',[y-80 y+80],'visible','on')
    pause(0.02)
    set(SS8,'Xdata',[x-80 x+80],'Ydata',[y-80 y+80],'visible','on')
    pause(0.02)
    set(SS9,'Xdata',[x-80 x+80],'Ydata',[y-80 y+80],'visible','on')
    pause(0.02)
    set(SS10,'Xdata',[x-80 x+80],'Ydata',[y-80 y+80],'visible','on')
    pause(0.02)
    set(SS11,'Xdata',[x-80 x+80],'Ydata',[y-80 y+80],'visible','on')
    pause(0.02)
    set(SS12,'Xdata',[x-80 x+80],'Ydata',[y-80 y+80],'visible','on')
    pause(0.02)
    set(SS13,'Xdata',[x-80 x+80],'Ydata',[y-80 y+80],'visible','on')
    pause(0.02)
    set(SS14,'Xdata',[x-80 x+80],'Ydata',[y-80 y+80],'visible','on')
    pause(0.02)
    set(SS15,'Xdata',[x-80 x+80],'Ydata',[y-80 y+80],'visible','on')
    pause(0.02)
    set(SS16,'Xdata',[x-80 x+80],'Ydata',[y-80 y+80],'visible','on')
    pause(0.02)
    set(SS17,'Xdata',[x-80 x+80],'Ydata',[y-80 y+80],'visible','on')
    pause(0.02)
    set(SS18,'Xdata',[x-80 x+80],'Ydata',[y-80 y+80],'visible','on')
    pause(0.02)
    set(SS19,'Xdata',[x-80 x+80],'Ydata',[y-80 y+80],'visible','on')
    pause(0.02)
    set(SS20,'Xdata',[x-80 x+80],'Ydata',[y-80 y+80],'visible','on')
    pause(0.02)
    set(SS21,'Xdata',[x-80 x+80],'Ydata',[y-80 y+80],'visible','on')
    pause(0.02)
    set(SS22,'Xdata',[x-80 x+80],'Ydata',[y-80 y+80],'visible','on')
    pause(0.02)
    set(SS23,'Xdata',[x-80 x+80],'Ydata',[y-80 y+80],'visible','on')
    pause(0.02)
    done=1;
end