clear all; close all; clc;
%% SET SCREEN RESOLUTION
screen_res
%%
fig = figure('position',[10 50 (screen_resolution(1)-20) (screen_resolution(2)-80)],'menubar','none','NAME',' CREDITS');
hold on
axis off
bkgrd = imread('credits.png');
bkgrd1 = image([bkgrd]);

[y,fs]= audioread('stillalive.mp3');
CreditsMusik=audioplayer(y,fs);
play(CreditsMusik)

hsurf13 = uicontrol('Style','pushbutton',...
    'String','Return','Position',[400,100,250,40], ...
    'Callback','MainMenu_GUI', ...
    'Fontsize',15,'ForegroundColor','green');

hsurf14 = uicontrol('Style','pushbutton',...
    'String','Exit','Position',[700,100,250,40], ...
    'Callback','clear; close all', ...
    'Fontsize',15,'ForegroundColor','green');

Launch = importdata('launch3.jpg');
set(hsurf13 ,'CDATA',Launch);
set(hsurf14 ,'CDATA',Launch);
