[y,fs]= audioread('fuel0.mp3');
F0=audioplayer(y,fs);

[y,fs]= audioread('fuel1.mp3');
F1=audioplayer(y,fs);

[y,fs]= audioread('fuel2.mp3');
F2=audioplayer(y,fs);

[y,fs]= audioread('fuel3.mp3');
F3=audioplayer(y,fs);

play1 = {F0,F1,F2,F3};
play(play1{randi(4)});