clear all; close all; clc;

%% SET SCREEN RESOLUTION HERE
screen_res

%% SET GIF LOCATION HERE PLEASE
GIF_LOCATION = 'C:\18020153\wormhole.gif';

%% SpaceInitializations
fig = figure('position',[10 50 screen_resolution(1)-200 screen_resolution(2)-200],'menubar','none','NAME',' SPACE ESCAPE: LEVEL 2','color','k');
hold on
axis equal
axis([0 2000 0 800])
axis off

bkgrd = imread('wormhole0.jpg');
bkgrd1 = image(bkgrd,'Xdata',[0 2005],'Ydata',[0 805]);
spawn = imread('spawn.png');
finish = imread('finish.png');
finish1 = image(finish,'Xdata',[1725 1975],'Ydata',[75 325]);
repair = imread('maintenance.png');
repair1 = image(repair,'Xdata',[950 1030],'Ydata',[300 380]);
fuelF = imread('fuel_1.png');
fuel1 = image(fuelF,'Xdata',[950 1030],'Ydata',[420 500]);

repairText = text(900,270,'Max Shields!','Fontsize',10,'Color','cyan','FontWeight','bold','visible','off');
fuelText = text(900,520,'Fuel +100','Fontsize',10,'Color','cyan','FontWeight','bold','visible','off');
Levelno = text(900,-75,'LEVEL 2','Fontsize',20,'Color','cyan','FontWeight','bold');

%% GIF CALL ACKNOWLEDGEMENTS -- http://undocumentedmatlab.com/blog/gui-integrated-html-panel/
je = javax.swing.JEditorPane('text/html', ['<html><img src="file:/' num2str(GIF_LOCATION) '"/></html>']);
[hj, hc] =  javacomponent(je,[],fig);
set(hc, 'pos', [153,115,167,167])

%% INITIALIZING VARIABLES
radius = 30;
linAcc = 0;
velocity = [0 0];
position = [150 600];
angAcc = 0;
angVel = 3;
angle = 0;
done = 0;
theta = [0 90 180 270];
x = [120 110 90]; %%Crafts Dimensions
y = [50 67 67]; %%Crafts Dimensions
keyPressed='';
shields = 3;
critshield = '';
shieldup = 0;
fuel = 40;
fuelup = 0;
score = 0;
scoreCAP = [0 0 0 0 0 0 0];
teleportXDATA = [1725 1975];
teleportYDATA = [75 325];
spawnXDATA = [25 275];
spawnYDATA = [475 725];
theta_ship = [0 144 216];
theta_circ = 0:359;

wormholeXDATA = [1500 1650];
wormholeYDATA = [500 650];
wormholeAUDIO = 0;
sInitial = [1000 400];
ballTHETA = 0;
critfuel = '';
fuelCAP = 0;

%% SETTING UP GRAPHICS

%% SpaceMazes
rectangle('Position',[0 390 2000 30],'facecolor',[0.4 0.4 0.4])

%% WORMHOLE CIRCLE
circAX = 1575;
circAY = 575;
circRAD = 80;
th = 0:pi/50:2*pi;
xunit = 1.2 * circRAD * cos(th) + circAX;
yunit = 1.2 * circRAD * sin(th) + circAY;
xunit_2 = circRAD * cos(th) + circAX;
yunit_2 = circRAD * sin(th) + circAY;
circA = plot(xunit, yunit,'Linewidth',2);
circB = plot(xunit_2, yunit_2,'Linewidth',2);
wormholeText = text(375,275,'Warp Drive Success!!','Fontsize',10,'Color','red','FontWeight','bold','visible','off');
% wormholeLoc1 = rectangle('Position',[1500 500 150 150],'facecolor','red','visible','on');
% wormholeLoc2 = rectangle('Position',[125 125 150 150],'facecolor','red','visible','on');

%% PARTICLE SYSTEM
Line1X=[sInitial(1) sInitial(1)+530];
Line1Y=[sInitial(2) sInitial(2)];
Line2X=[sInitial(1)+80 sInitial(2)+90];
Line2Y=[sInitial(1) sInitial(2)];
Line1=plot(Line1X,Line1Y,'r','LineWidth',2,'visible','off'); % Line 1 Handler
Line2=plot(Line2X,Line2Y,'b','LineWidth',5,'visible','off'); % Line 2 handler
ball1 = rectangle('position', [67,47,6,6],'curvature', [1 1],'facecolor', [1 0 0],'visible','off');
ball2 = rectangle('position', [67,47,6,6],'curvature', [1 1],'facecolor', [1 0 0],'visible','off');

%% SPRITES
wormholeSprite
explosionSprite
spawnSprite; spawnIF;
teleportSprite;
spawn1 = image(spawn,'Xdata',spawnXDATA,'Ydata',spawnYDATA);
%% Making SpaceShip FUNCTION
[h_ship, h_circ, h_circ2] = makeSpaceShip(position,radius,angle);

%% START AUDIO
[y,fs]= audioread('battlefieldCROP.mp3');
Level2Musik=audioplayer(y,fs);
play(Level2Musik)
startAUDIO

warndlg('May the force be with you!', 'LEVEL 2', 'modal');
%% KEY PRESS
set(fig,'KeyPressFcn','keyPressed=get(fig,''CurrentCharacter'');')
set(fig,'KeyReleaseFcn','keyPressed='''';')
tic;

%% MAIN LOOP
while done==0
    %% HeadupDisplay
    HUD_title
    
    %% ChkKeyPress
    Key_Press_Chk
    
    %% Ang_Vel_Pos_Update
    Ang_Vel_Pos_Update
    
    %% Set_And_Get
    
    %% Co-ordinates Setup
    x = 20.*cosd(theta+angle)+position(1);
    y = 20.*sind(theta+angle)+position(2);
    
    %% SET SHIP FUNCTION
    ShipNav(h_ship, h_circ, h_circ2, position, angle, radius)
    
    %% PARTICLE SYSTEM
    ballTHETA = ballTHETA + 1;
    if ballTHETA == 360
        ballTHETA = 0;
    end
    Line1X(2) =250*cosd(2.*ballTHETA)+sInitial(1);
    Line1Y(2) =250*sind(2.*ballTHETA)+sInitial(2);
    Line2X(1)=Line1X(2);
    Line2Y(1)=Line1Y(2);
    Line2X(2)=100*cosd(10*ballTHETA)+Line1X(2);
    Line2Y(2)=100*sind(10*ballTHETA)+Line1Y(2);
    set(ball1,'position', [Line2X(2)-25 Line2Y(2)-25 50 50],'facecolor',rand(1,3),'visible','on')
    set(ball2,'position', [Line2X(1)-25 Line2Y(1)-25 50 50],'facecolor',rand(1,3),'visible','on')
    
    %% WORMHOLE
    set(circA,'color',rand(1,3));
    set(circB,'color',rand(1,3));
    
    %% GET
    cShipX = get(h_ship,'Xdata')+40;
    cShipY = get(h_ship,'Ydata')+40;
    repairX = get(repair1,'Xdata');
    repairY = get(repair1,'Ydata');
    fuelX = get(fuel1,'Xdata');
    fuelY = get(fuel1,'Ydata');
    
    orbital1 = get(ball1,'Position');
    orbital2 = get(ball2,'Position');
    
    %% IF CONDITIONS
    
    %% SCORING
    if scoreCAP(1) == 0
        if max(cShipY) <= 100
            score = score + 10;
            scoreCAP(1) = 1;
        end
    end
    %     if scoreCAP(2) == 0
    %         if max(cShipY) >= 650
    %             score = score + 10;
    %             scoreCAP(2) = 1;
    %         end
    %     end
    
    %% Boundary Conditions
    L2_Boundary_IFS
    
    %%     Upgrade Packs Conditions
    shield_repair
    fuel_upgrade
    
    %%     WinCondition
    if max(cShipX) >= 1825 && min(cShipX) <= 1875 && max(cShipY) >= 100 && min(cShipY) <= 300;
        win_condition
    end
    pause(0.001)
end

%% LOSE CONDITION
lose_condition

%% GAME FINISHED
if done == 3
    stop(Level2Musik)
    victoryAUDIO
    pause(10)
    close all;
    Level3
end