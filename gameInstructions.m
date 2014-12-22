clear all; close all; clc;
screen_res
fig = figure('position',[10 50 (screen_resolution(1)-20) (screen_resolution(2)-80)],'menubar','none','NAME',' SPACE ESCAPE: LEVEL 1');
hold on
axis off
bkgrd = imread('instructions.png');
bkgrd1 = image([bkgrd]);

hsurf15 = uicontrol('Style','pushbutton',...
    'String','Return','Position',[400,100,250,40], ...
    'Callback','MainMenu_GUI', ...
    'Fontsize',15,'ForegroundColor','green');

hsurf16 = uicontrol('Style','pushbutton',...
    'String','Exit','Position',[700,100,250,40], ...
    'Callback','clear; close all', ...
    'Fontsize',15,'ForegroundColor','green');

Launch = importdata('launch3.jpg');
set(hsurf15 ,'CDATA',Launch);
set(hsurf16 ,'CDATA',Launch);

[y,fs]= audioread('WelcomeBackCommander.mp3');
instructionsAUDIO=audioplayer(y,fs);
play(instructionsAUDIO);