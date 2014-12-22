 if keyPressed=='q'
        linAcc = 0;
        angAcc = 0;
        warndlg('You Surrendered', 'COWARD!', 'modal');
        done=1;
    elseif keyPressed=='a'
        linAcc = 0;
        angAcc = 1;
    elseif keyPressed=='d'
        linAcc = 0;
        angAcc = -1;
    elseif keyPressed=='w'
        linAcc = 1;
        angAcc = 0;
    elseif keyPressed=='s'
        linAcc = -1;
        angAcc = 0;
    elseif keyPressed=='e'
        velocity = [0 0];
        angVel = 0;
    end