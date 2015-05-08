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
%         [skDir]=arDataDirectory(dataDir,si,ei,'skeleton');
        [data]=arDataImport(dataDir,si,ei,'skeleton','skeleton');
    end
end



%% List of feature to analyze in Abu2014
% Body_Or =[roll,pitch,yaw] = {1,2,3}
% Head_Or =[roll,pitch,yaw] = {4,5,6}
% ShoulderR_Or =[roll,pitch,yaw] = {7,8,9}
% ShoulderL_Or =[roll,pitch,yaw] = {10,11,12}
% HandR_NormVect =[dX,dY,dZ]  = {13,14,15}
% ElbowR_NormVect =[dX,dY,dZ]  = {16,17,18}			 
% HandL_NormVect =[dX,dY,dZ]   = {19,20,21}
% ElbowL_NormVect =[dX,dY,dZ]   = {22,23,24}
Fnum=[1];
% %% List of activity to analyze
% act={'Enter','Drink','Rorder','Leave'};



%% 
for ai=1:numel(act)
    for si= 1:length (Snum)
        for fi=1:length(Fnum)
            % Get name of the data to analyzed
            filename=[act{ai},' (',num2str(si),').txt'];
%             data=importdata(filename);
            data=importfile(filename);
            
            % Parameter list
            % Time spend to perfom the action (in # of frame {time sampling
            % 33 ms})
            numFrame(si,ai)=size(data,1);
            numFeature(si,ai)=size(data,2);
            
            
            
            
        end
    end
end
