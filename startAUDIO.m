[y,fs]= audioread('start0.mp3');
C0=audioplayer(y,fs);

[y,fs]= audioread('start1.mp3');
C1=audioplayer(y,fs);

[y,fs]= audioread('start2.mp3');
C2=audioplayer(y,fs);

[y,fs]= audioread('start3.mp3');
C3=audioplayer(y,fs);

[y,fs]= audioread('start4.mp3');
C4=audioplayer(y,fs);

play1 = {C0,C1,C2,C3,C4};
play(play1{randi(5)});