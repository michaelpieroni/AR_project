clear all
close all

%% In this script we compute the Feature Vector from orginal skeleton data


%% STANDARD INITIALIZATION
%%ADD path
[relDir,dataDir]=arPath(arRootPath);
addpath(relDir);
% DO NOT add dataDir to avoid same several files with the same name


%% Listo of subject to analyze
Snum=[1];


%% Listo of exp to analyze
ExpN=1;

for si=1:length(Snum)
    for ei=1:length(ExpN)
        [data]=arDataImport(dataDir,si,ei,'skeleton','angle&skeleton');
        
        numFrame=1;
        
        numJoint=arGet(data,'number of joint');
%         numJoint=(size(data(numFrame,2:end),2))/3;
        dataPos=arGet(data,'position');
        figure
        for ji=1:numJoint
            vx(ji)=dataPos(numFrame,3*ji-1);
            vy(ji)=dataPos(numFrame,3*ji);
            vz(ji)=dataPos(numFrame,3*ji+1);
            scatter3(vx(ji),vy(ji),vz(ji))   
            hold on
        end
        
        
    end
end



%% EXAMPLE : get position and coordinate
[joint]=arGet(data,'position','KneeRight');
scatter3(joint(numFrame,1),joint(numFrame,2),joint(numFrame,3),'filled') 
[jointX]=arGet(data,'position','KneeRight','y');


%% EXAMPLE : get angle and direction
[orient]=arGet(data,'angle','FootRight');
[orientYaw]=arGet(data,'angle','FootRight','yaw');




