[y,fs]= audioread('hit0.mp3');
A0=audioplayer(y,fs);

[y,fs]= audioread('hit1.mp3');
A1=audioplayer(y,fs);

[y,fs]= audioread('hit2.mp3');
A2=audioplayer(y,fs);

[y,fs]= audioread('hit3.mp3');
A3=audioplayer(y,fs);

[y,fs]= audioread('hit4.mp3');
A4=audioplayer(y,fs);

[y,fs]= audioread('hit5.mp3');
A5=audioplayer(y,fs);

play1 = {A0,A1,A2,A3,A4,A5};
play(play1{randi(6)});