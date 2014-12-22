if done == 1
    loseAUDIO
    pause(1)
    if score < 30
        warndlg(['IDIOT NOOB!   Your puny score = ' num2str(score)], 'YOU LOSE', 'modal');
    else
        warndlg(['Better luck next time!   Your score = ' num2str(score)], 'YOU LOSE', 'modal');
    end
    pause(2)
    lose_GUI
end