[y,fs]= audioread('lose0.mp3');
B0=audioplayer(y,fs);

[y,fs]= audioread('lose1.mp3');
B1=audioplayer(y,fs);

[y,fs]= audioread('lose2.mp3');
B2=audioplayer(y,fs);

[y,fs]= audioread('lose3.mp3');
B3=audioplayer(y,fs);

[y,fs]= audioread('lose4.mp3');
B4=audioplayer(y,fs);

play1 = {B0,B1,B2,B3,B4};
play(play1{randi(5)});