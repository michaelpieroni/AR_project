clear all
close all


%% List of activity to analyze
act={'Enter','Drink','Rorder','Leave'};

%% Listo of subject to analyze
Snum=[1:30];

%% List of feature to analyze
% Body_Or =[roll,pitch,yaw] = {1,2,3}
% Head_Or =[roll,pitch,yaw] = {4,5,6}
% ShoulderR_Or =[roll,pitch,yaw] = {7,8,9}
% ShoulderL_Or =[roll,pitch,yaw] = {10,11,12}
% HandR_NormVect =[dX,dY,dZ]  = {13,14,15}
% ElbowR_NormVect =[dX,dY,dZ]  = {16,17,18}			 
% HandL_NormVect =[dX,dY,dZ]   = {19,20,21}
% ElbowL_NormVect =[dX,dY,dZ]   = {22,23,24}
Fnum=[1];



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