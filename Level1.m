clear all; close all; clc;

%% SET SCREEN RESOLUTION HERE
screen_res

%% SpaceInitializations
fig = figure('position',[500 50 (screen_resolution(1)-800) (screen_resolution(2)-80)],'menubar','none','NAME',' SPACE ESCAPE: LEVEL 1','color','k');
hold on
axis equal
axis([0 800 0 2000])
axis off

bkgrd = imread('level1space.png');
bkgrd1 = image(bkgrd,'Xdata',[0 805],'Ydata',[0 2005]);
spawn = imread('spawn.png');
finish = imread('finish.png');
finish1 = image(finish,'Xdata',[275 525],'Ydata',[1700 1950]);
repair = imread('maintenance.png');
repair1 = image(repair,'Xdata',[80 160],'Ydata',[720 800]);
fuelF = imread('fuel_1.png');
fuel1 = image(fuelF,'Xdata',[650 730],'Ydata',[720 800]);

repairText = text(30,825,'Max Shields!','Fontsize',10,'Color','cyan','FontWeight','bold','visible','off');
fuelText = text(625,825,'Fuel +100','Fontsize',10,'Color','cyan','FontWeight','bold','visible','off');
Levelno = text(200,-80,'LEVEL 1','Fontsize',20,'Color','cyan','FontWeight','bold');

%% INITIALIZING VARIABLES
radius = 30;
linAcc = 0;
velocity = [0 0];
position = [400 150];
angAcc = 0;
angVel = 3;
angle = 0;
done = 0;
ObsX = 1000;
ObsVel = 10;
theta = [0 90 180 270];
x = [120 110 90]; %%Crafts Dimensions
y = [50 67 67]; %%Crafts Dimensions
keyPressed='';
shields = 3;
critshield = '';
shieldup = 0;
fuel = 100;
fuelup = 0;
score = 0;
scoreCAP = [0 0 0 0 0 0 0];
teleportXDATA = [275 525];
teleportYDATA = [1700 1950];
spawnXDATA = [275 525];
spawnYDATA = [25 275];
theta_ship = [0 144 216];
theta_circ = 0:359;

gate1Height = 15;
gate2Height = 10;
gate3Height = 10;
gate1Vel = 5;
gate2Vel = 5;
gate3Vel = 5;
Pradius = [25 25];
planetVel = 2;
critfuel = '';
fuelCAP = 0;

%% Setting up Graphics

%SpaceMazes
rectangle('Position',[0 300 600 40],'facecolor',[0.4 0.4 0.4])
rectangle('Position',[200 600 600 40],'facecolor',[0.4 0.4 0.4])
rectangle('Position',[0 900 300 40],'facecolor',[0.4 0.4 0.4])
rectangle('Position',[500 900 300 40],'facecolor',[0.4 0.4 0.4])
%Obstacles
Gate1 = rectangle('Position',[525 640 40 gate2Height],'facecolor',[1 0 0.5]);
Gate2 = rectangle('Position',[225 890 40 gate3Height],'facecolor',[1 1 0.5]);
Gate3 = rectangle('Position',[225 890 40 gate3Height],'facecolor',[1 0 0.5]);

%% SOLAR SYSTEM
sun = rectangle('Position',[400-Pradius(1).*1.5 1300-Pradius(1).*1.5 Pradius.*3],'facecolor','y','curvature',[1 1]);
planet1 = rectangle('Position',[400-Pradius(1) 1300-Pradius(1) Pradius.*2],'facecolor','c','curvature',[1 1]);
planet2 = rectangle('Position',[400-Pradius(1) 1300-Pradius(1) Pradius.*2],'facecolor','g','curvature',[1 1]);
planet3 = rectangle('Position',[400-Pradius(1) 1300-Pradius(1) Pradius.*2],'facecolor','b','curvature',[1 1]);

theta = 0:720;
p1Cenx = 100*cosd(theta);
p1Ceny = 100*sind(theta);
p2Cenx = 200*cosd(theta);
p2Ceny = 200*sind(theta);
p3Cenx = 300*cosd(theta);
p3Ceny = 300*sind(theta);
ranx1 = round(rand .* 360);
ranx2 = round(rand .* 360);
ranx3 = round(rand .* 360);
looptheta = 0;

%% SPRITES
spawnSprite; spawnIF;
teleportSprite;
spawn1 = image(spawn,'Xdata',[275 525],'Ydata',[25 275]);
explosionSprite;

%% Making SpaceShip FUNCTION
[h_ship, h_circ, h_circ2] = makeSpaceShip(position,radius,angle);

%% START AUDIO
[y,fs]= audioread('codCROP.mp3');
Level1Musik=audioplayer(y,fs);
play(Level1Musik)
startAUDIO

warndlg('BON VOYAGE!', 'LEVEL 1', 'modal');
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
    
    %% GATES
    
    gate1Height = gate1Height - gate1Vel;
    if gate1Height == 10
        gate1Vel = -gate1Vel;
    elseif gate1Height == 260
        gate1Vel = -gate1Vel;
    end
    gate2Height = gate2Height + gate2Vel;
    if gate2Height >= 260
        gate2Vel = -gate2Vel;
    elseif gate2Height <= 10
        gate2Vel = -gate2Vel;
    end
    gate3Height = gate3Height + gate3Vel;
    if gate3Height >= 260
        gate3Vel = -gate3Vel;
    elseif gate3Height <= 10
        gate3Vel = -gate3Vel;
    end
    
    set(Gate1,'Position',[525 640 40 gate1Height])
    set(Gate2,'Position',[100+gate2Height 340 40 gate2Height]);
    set(Gate3,'Position',[225 900-gate2Height 40 gate2Height]);
    
    %% SOLAR SYSTEM
    
    looptheta = looptheta + planetVel;
    if looptheta >= 359
        looptheta = 0;
    end
    set(planet1,'Position',[400+p1Cenx(looptheta+ranx1)-Pradius(1),1300+p1Ceny(looptheta+ranx1)-Pradius(1),2.*Pradius],'facecolor',rand(1,3))
    set(planet2,'Position',[400+p2Cenx(looptheta+ranx2)-Pradius(1),1300+p2Ceny(looptheta+ranx2)-Pradius(1),2.*Pradius],'facecolor',rand(1,3))
    set(planet3,'Position',[400+p3Cenx(looptheta+ranx3)-Pradius(1),1300+p3Ceny(looptheta+ranx3)-Pradius(1),2.*Pradius],'facecolor',rand(1,3))
    
    
    %% GET
    cShipX = get(h_ship,'Xdata')+40;
    cShipY = get(h_ship,'Ydata')+40;
    repairX = get(repair1,'Xdata');
    repairY = get(repair1,'Ydata');
    fuelX = get(fuel1,'Xdata');
    fuelY = get(fuel1,'Ydata');
    
    sun1 = get(sun,'Position');
    orbit1 = get(planet1,'Position');
    orbit2 = get(planet2,'Position');
    orbit3 = get(planet3,'Position');
    cgate1 = get(Gate1,'Position');
    cgate2 = get(Gate2,'Position');
    cgate3 = get(Gate3,'Position');
    
    %% IF CONDITIONS
    
    %% SCORING
    if scoreCAP(1) == 0
        if max(cShipY) >= 350
            score = score + 10;
            scoreCAP(1) = 1;
        end
    end
    if scoreCAP(2) == 0
        if max(cShipY) >= 650
            score = score + 10;
            scoreCAP(2) = 1;
        end
    end
    if scoreCAP(3) == 0
        if max(cShipY) >= 950
            score = score + 10;
            scoreCAP(3) = 1;
        end
    end
    if scoreCAP(4) == 0
        if max(cShipY) >= 1572
            score = score + 10;
            scoreCAP(4) = 1;
        end
    end
    
    %% Boundary Conditions
    L1_Boundary_IFS
    
    %% Upgrade Packs Conditions
    shield_repair
    fuel_upgrade
    
    %% WinCondition
    if max(cShipX) >= 375 && min(cShipX) <= 425 && max(cShipY) >= 1800 && min(cShipY) <= 1850;
        win_condition
    end
    pause(0.001)
end

%% LOSE CONDITION
lose_condition

%% LEVEL UP
if done == 3
    stop(Level1Musik)
    victoryAUDIO
    pause(10)
    close all;
    Level2
end