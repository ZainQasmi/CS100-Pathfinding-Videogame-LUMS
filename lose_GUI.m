clear all; clc; close all

%% SET GIF LOCATION HERE PLEASE
GIF_LOCATION = 'C:\18020153\shipanimation.gif';
%% SET SCREEN RESOLUTION HERE
screen_res


%% SpaceInitializations
Fig = figure('Position',[10 50 screen_resolution(1)-20 screen_resolution(2)-80],'menubar','none','NAME',' MENU','color','k');
hold on
axis equal
axis off

bkgrd = imread('starcraft.png');
bkgrd1 = image(bkgrd,'Xdata',[0 1920],'Ydata',[0 1080]);
[logo, map, alpha] = imread('logoF.png');
logo1 = image(logo,'Xdata',[50 1900],'Ydata',[775 1025],'Alphadata',alpha);

%% GIF CALL ACKNOWLEDGEMENTS -- http://undocumentedmatlab.com/blog/gui-integrated-html-panel/
je = javax.swing.JEditorPane('text/html', ['<html><img src="file:/' num2str(GIF_LOCATION) '"/></html>']);
[hj, hc] =  javacomponent(je,[],Fig);
set(hc,'pos', [455,230,483,206]);

hsurf10 = uicontrol('Style','pushbutton',...
    'String','Retry','Position',[570,360,250,40], ...
    'Callback','Level1', ...
    'Fontsize',15,'ForegroundColor','green');

hsurf11 = uicontrol('Style','pushbutton',...
    'String','Main Menu','Position',[570,310,250,40], ...
    'Callback','MainMenu_GUI', ...
    'Fontsize',15,'ForegroundColor','green');

hsurf12 = uicontrol('Style','pushbutton',...
    'String','Quit','Position',[570,260,250,40], ...
    'Callback','clear; close all', ...
    'Fontsize',15,'ForegroundColor','green');

[y,fs]= audioread('interstellarCROP.mp3');
MenuTheme2=audioplayer(y,fs);
play(MenuTheme2);

Launch = importdata('launch3.jpg');
set(hsurf10 ,'CDATA',Launch);
set(hsurf11 ,'CDATA',Launch);
set(hsurf12 ,'CDATA',Launch);