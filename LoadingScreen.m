clear all; clc; close all

%% SET SCREEN RESOLUTION HERE
screen_res

%% AUDIO - WELCOME BACK COMMANDER
[y,fs]= audioread('WelcomeBackCommander.mp3');
   LoadingAudio=audioplayer(y,fs);
     play(LoadingAudio);
     
%% GRAPHICS

Fig = figure('Position',[10 50 screen_resolution(1)-20 screen_resolution(2)-80],'menubar','none','NAME',' LOADING...','color','k'); 
hold on
axis equal
axis([0 2400 0 2000])
axis off

background = imread('LoadingScreen.png');
image([background]);

Percentage = 0;

h0 = rectangle('Position', [825 900 800 100],'facecolor','w','curvature',[0 0]);
h1 = rectangle('Position',[1400 1400 100 100],'facecolor','g');
h5 = text(900,1150,'Loading...','Fontsize',[32],'Color','red','FontWeight','bold','Fontname','Comic Sans MS');
h3 = text(1050,750,[num2str(Percentage)],'Fontsize',[40],'Color','red','Fontname','Comic Sans MS');
h4 = text(1225,1800,'ProjeKt CS-101','Fontsize',[40],'Color','yellow','FontAngle','italic','FontWeight','bold','Fontname','Monotype Corsiva');

%%CIRCLE
x1=[1200 1280];
y1=[950 850];
h2=plot(x1,y1,'w');

tic
for i =0:1:360
    Percentage = Percentage + (5/18);
    PercentageR = sprintf('%.0f',Percentage);
    set(h1,'Position',[825 900 80+(i*2) 100],'facecolor','g');
    set(h3,'String',[num2str(PercentageR) '%']);
    x1(2) =500*cosd(i)+1200;
    y1(2) =500*sind(i)+950;
    rectangle('Position', [x1(2)-4 y1(2)-4 80 80],'curvature',[1 1],'facecolor','m')
    pause(i/100-toc)
end
