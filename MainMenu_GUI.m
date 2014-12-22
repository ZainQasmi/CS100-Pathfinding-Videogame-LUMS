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
logo1 = image(logo,'Xdata',[950 1900],'Ydata',[775 1025],'Alphadata',alpha);

%% GIF CALL ACKNOWLEDGEMENTS -- http://undocumentedmatlab.com/blog/gui-integrated-html-panel/
je = javax.swing.JEditorPane('text/html', ['<html><img src="file:/' num2str(GIF_LOCATION) '"/></html>']);
[hj, hc] =  javacomponent(je,[],Fig);
set(hc,'pos', [200,430,483,206]);

%% .

vText = text(1650,20,'Version 1.002','Fontsize',15,'Color','cyan','FontWeight','bold','Fontname','Times New Roman');

hsurf1 = uicontrol('Style','pushbutton',...
    'String','New Game','Position',[220,350,250,40], ...
    'Callback','Level1', ...
    'Fontsize',15,'ForegroundColor','green');

hsurf2 = uicontrol('Style','pushbutton',...
    'String','Select Level','Position',[220,300,250,40], ...
    'Callback','selectLevel', ...
    'Fontsize',15,'ForegroundColor','green');

hsurf3 = uicontrol('Style','pushbutton',...
    'String','Instructions','Position',[220,250,250,40], ...
    'Callback','gameInstructions', ...
    'Fontsize',15,'ForegroundColor','green');

hsurf4 = uicontrol('Style','pushbutton',...
    'String','Options','Position',[220,200,250,40], ...
    'Callback','cake_lie', ...
    'Fontsize',15,'ForegroundColor','green');

hsurf5 = uicontrol('Style','pushbutton',...
    'String','Credits','Position',[220,150,250,40], ...
    'Callback','game_Credits', ...
    'Fontsize',15,'ForegroundColor','green');

hsurf6 = uicontrol('Style','pushbutton',...
    'String','Exit','Position',[220,100,250,40], ...
    'Callback','clear; close all', ...
    'Fontsize',15,'ForegroundColor','green');

[y,fs]= audioread('interstellarCROP.mp3');
MenuTheme=audioplayer(y,fs);
play(MenuTheme);

Launch = importdata('launch3.jpg');

set(hsurf1 ,'CDATA',Launch);
set(hsurf2 ,'CDATA',Launch);
set(hsurf3 ,'CDATA',Launch);
set(hsurf4 ,'CDATA',Launch);
set(hsurf5 ,'CDATA',Launch);
set(hsurf6 ,'CDATA',Launch);