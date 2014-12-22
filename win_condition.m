[y,fs]= audioread('teleportCROP1.mp3');
WinMusik=audioplayer(y,fs);
play(WinMusik)

teleportIF
score = score + 100;
warndlg(['You are Awesome! Levelup. Your score = ' num2str(score)], 'YOU WIN', 'modal');
done=3;