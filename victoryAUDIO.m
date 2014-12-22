[y,fs]= audioread('victory0.mp3');
H0=audioplayer(y,fs);

[y,fs]= audioread('victory1.mp3');
H1=audioplayer(y,fs);

play1 = {H0,H1};
play(play1{randi(2)});