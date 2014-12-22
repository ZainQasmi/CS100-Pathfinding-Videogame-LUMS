clear all; close all; clc;

%% SET SCREEN RESOLUTION HERE
screen_res

%% SpaceInitializations
fig = figure('position',[10 50 (screen_resolution(1)-200) (screen_resolution(2)-80)],'menubar','none','NAME',' SPACE ESCAPE: LEVEL 3','color','k');
hold on
axis equal
axis([0 2184 0 1472])
axis off

bkgrd = imread('space.png');
bkgrd1 = image([bkgrd]);
spawn = imread('spawn.png');
finish = imread('finish.png');
finish1 = image(finish,'Xdata',[1100 1350],'Ydata',[1200 1450]);
repair = imread('maintenance.png');
repair1 = image(repair,'Xdata',[80 160],'Ydata',[850 930]);
fuelF = imread('fuel_1.png');
fuel1 = image(fuelF,'Xdata',[1975 2055],'Ydata',[150 230]);

repairText = text(60,975,'Max Shields!','Fontsize',10,'Color','cyan','FontWeight','bold','visible','off');
fuelText = text(1900,275,'Fuel +100','Fontsize',10,'Color','cyan','FontWeight','bold','visible','off');
Levelno = text(1000,-75,'LEVEL 3','Fontsize',20,'Color','cyan','FontWeight','bold');

%% INITIALIZING VARIABLES
radius = 30;
linAcc = 0;
velocity = [0 0];
position = [175 175];
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
fuel = 200;
fuelup = 0;
score = 0;
scoreCAP = [0 0 0 0 0 0 0];
teleportXDATA = [1100 1350];
teleportYDATA = [1200 1450];
spawnXDATA = [50 300];
spawnYDATA = [50 300];
theta_ship = [0 144 216];
theta_circ = 0:359;

gate1Width = 15;
gate2Width = 10;
gate1Vel = 5;
gate2Vel = 5;
critfuel = '';
fuelCAP = 0;

%% Setting up Graphics

%% SpaceMaze
rectangle('Position',[-10 300 50 450],'facecolor',[0.4 0.4 0.4])
rectangle('Position',[50 -10 920 50],'facecolor',[0.4 0.4 0.4])
rectangle('Position',[0 1425 980 50],'facecolor',[0.4 0.4 0.4])
rectangle('Position',[950 -1 50 1600],'facecolor',[0.4 0.4 0.4])
rectangle('Position',[0 700 500 50],'facecolor',[0.4 0.4 0.4])
rectangle('Position',[500 700 40 250],'facecolor',[0.4 0.4 0.4])
rectangle('Position',[-10 1100 50 700],'facecolor',[0.4 0.4 0.4])
rectangle('Position',[1450 400 50 1600],'facecolor',[0.4 0.4 0.4])
rectangle('Position',[1800 000 50 1100],'facecolor',[0.4 0.4 0.4])
rectangle('Position',[1850 400 350 50],'facecolor',[0.4 0.4 0.4])

%% All_Handles
sun = rectangle('Position',[475 1050 80 80],'facecolor','yellow','curvature',[1 1]);

%% Obstacle
Obs1 = rectangle('Position',[ObsX 300 200 50],'facecolor','green','curvature',[0.75 0.75]);
craft1 = fill(x,y,'yellow');
craft2 = fill(x,y,'magenta');
craft3 = fill(x,y,'cyan');
Gate1 = rectangle('Position',[1000 1000 gate1Width 100],'facecolor',[1 0 0.5]);
Gate2 = rectangle('Position',[1225 1000 225 100],'facecolor',[1 0 0.5]);

%% SPRITES
explosionSprite
spawnSprite; spawnIF;
teleportSprite;
spawn1 = image(spawn,'Xdata',[50 300],'Ydata',[50 300]);

%% Making SpaceShip FUNCTION
[h_ship, h_circ, h_circ2] = makeSpaceShip(position,radius,angle);

%% START AUDIO
[y,fs]= audioread('inceptionCROP.mp3');
Level3Musik=audioplayer(y,fs);
play(Level3Musik)
startAUDIO

warndlg('YOU WILL NOT SURVIVE!                                                                  Hint: Boundaries let you tunnel through sectors.', 'LEVEL 3', 'modal');
%% KEY PRESS
set(fig,'KeyPressFcn','keyPressed=get(fig,''CurrentCharacter'');')
set(fig,'KeyReleaseFcn','keyPressed='''';')
tic;

%% MAIN LOOP
while done==0
    %% HeadupDisplay
    HUD_title
    
    %% TITLE DISPLAY
    title(['Score = ',num2str(score),'    ','Fuel = ',num2str(fuelR),' ','litres','    ','Shields = ',num2str(shields-1),'    ',num2str(critshield),'    ',num2str(critfuel)],'Color','red','FontWeight','bold');
    
    %% ChkKeyPress
    Key_Press_Chk
    
    %% Ang_Vel_Pos_Update
    Ang_Vel_Pos_Update
    
    %% Set_And_Get
    
    %% Co-ordinates Setup
    x = 20.*cosd(theta+angle)+position(1);
    y = 20.*sind(theta+angle)+position(2);
    x1 = 100.*cosd(theta+(toc.*100));
    y1 = 100.*sind(theta+(toc.*100));
    
    %% SET SHIP FUNCTION
    ShipNav(h_ship, h_circ, h_circ2, position, angle, radius)
    
    ObsX = ObsX + ObsVel;
    if ObsX == 1600
        ObsVel = -ObsVel;
    elseif ObsX == 1000
        ObsVel = -ObsVel;
    end
    
    gate1Width = gate1Width - gate1Vel;
    if gate1Width == 10
        gate1Vel = -gate1Vel;
    elseif gate1Width == 225
        gate1Vel = -gate1Vel;
    end
    
    gate2Width = gate2Width + gate2Vel;
    if gate2Width >= 225
        gate2Vel = -gate2Vel;
    elseif gate2Width <= 10
        gate2Vel = -gate2Vel;
    end
    
    %% SET
    set(Obs1,'Position',[ObsX 300 200 50],'curvature',[0.75 0.75])
    set(craft1,'Xdata',x1+200,'Ydata',y1+500)
    set(craft2,'Xdata',x1+500,'Ydata',y1+500)
    set(craft3,'Xdata',x1+800,'Ydata',y1+500)
    set(Gate1,'Position',[1000 1000 gate1Width 100])
    set(Gate2,'Position',[1450-gate2Width 1000 gate2Width 100]);
    
    %% GET
    cShipX = get(h_ship,'Xdata')+40;
    cShipY = get(h_ship,'Ydata')+40;
    repairX = get(repair1,'Xdata');
    repairY = get(repair1,'Ydata');
    fuelX = get(fuel1,'Xdata');
    fuelY = get(fuel1,'Ydata');
    
    cX1  = get(craft1,'Xdata');
    cX2  = get(craft2,'Xdata');
    cX3  = get(craft3,'Xdata');
    cY1  = get(craft1,'Ydata');
    cY2  = get(craft2,'Ydata');
    cY3  = get(craft3,'Ydata');
    cObs1 = get(Obs1,'Position');
    cGate = get(Gate1,'Position');
    cGate2 = get(Gate2,'Position');
    
    %% IF CONDITIONS
    
    %% SCORING
    if scoreCAP(1) == 0
        if max(cShipY) >= 800 && max(cShipX) <= 950
            score = score + 10;
            scoreCAP(1) = 1;
        end
    end
    if scoreCAP(2) == 0
        if max(cShipY) >= 750 && max(cShipY) <= 1100 && max(cShipX) <= 100
            score = score + 10;
            scoreCAP(2) = 1;
        end
    end
    if scoreCAP(3) == 0
        if max(cShipY) <= 350 && max(cShipX) >= 1000 && max(cShipX) <= 1800
            score = score + 10;
            scoreCAP(3) = 1;
        end
    end
    if scoreCAP(4) == 0
        if max(cShipY) >= 1100 && max(cShipX) >= 1000 && max(cShipX) <= 1450
            score = score + 10;
            scoreCAP(4) = 1;
        end
    end
    
    %% Boundary Conditions
    L3_Boundary_IFS
    
    %% Upgrade Packs Conditions
    shield_repair
    fuel_upgrade
    
    %% WinCondition
    if max(cShipX) >= 1200 && min(cShipX) <= 1250 && max(cShipY) >= 1300 && min(cShipY) <= 1350;
        win_condition
    end
    pause(0.001)
end

%% LOSE CONDITION
lose_condition

%% LEVEL UP
if done == 3
    stop(Level3Musik)
    victoryAUDIO
    pause(10)
    close all;
    warndlg(['Congratulations. You survived the interstellar journey. You SIR are a PRO!'], 'YOU WIN', 'modal');
    game_Credits
end