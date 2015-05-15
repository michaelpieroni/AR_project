function [ FV ] = arFeatureVectorAbu( DATA )
%ARFEATUREVECTORABU Summary of this function goes here
%   Detailed explanation goes here


FVname={'bodyOrient';'headOrient';'shoulderRightOrient';'shoulderleftOrient';
        'handRightPos';'elbowRightPos','handLeftPos';'elbowLeftPos'};
numFV=8;
		 
         deltaX_Hand_righ_Hipcenter = arGet(DATA,'position','HandRight','x')-arGet(DATA,'position','HipCenter','x');
         deltaY_Hand_righ_Hipcenter = arGet(DATA,'position','HandRight','y')-arGet(DATA,'position','HipCenter','y');
         deltaZ_Hand_righ_Hipcenter = arGet(DATA,'position','HandRight','z')-arGet(DATA,'position','HipCenter','z');
         delta_Hand_righ_Hipcenter = [deltaX_Hand_righ_Hipcenter,deltaY_Hand_righ_Hipcenter,deltaZ_Hand_righ_Hipcenter];
         NormalRH = sqrt(deltaX_Hand_righ_Hipcenter^2+deltaY_Hand_righ_Hipcenter^2,deltaZ_Hand_righ_Hipcenter^2)

      
         deltaX_Elbow_righ_Hipcenter = arGet(DATA,'position','ElbowRight','x')-arGet(DATA,'position','HipCenter','x');
         deltaY_Elbow_righ_Hipcenter = arGet(DATA,'position','ElbowRight','y')-arGet(DATA,'position','HipCenter','y');
         deltaZ_Elbow_righ_Hipcenter = arGet(DATA,'position','ElbowRight','z')-arGet(DATA,'position','HipCenter','z');
         delta_Hand_righ_Hipcenter = [deltaX_Hand_righ_Hipcenter,deltaY_Hand_righ_Hipcenter,deltaZ_Hand_righ_Hipcenter];
         NormalRE = sqrt(deltaX_Elbow_right_Hipcenter^2+deltaY_Elbow_right_Hipcenter^2,deltaZ_Elbow_right_Hipcenter^2)

      
         deltaX_Hand_left_Hipcenter = arGet(DATA,'position','HandLeft','x')-arGet(DATA,'position','HipCenter','x');
         deltaY_Hand_left_Hipcenter = arGet(DATA,'position','HandLeft','y')-arGet(DATA,'position','HipCenter','y');
         deltaZ_Hand_left_Hipcenter = arGet(DATA,'position','HandLeft','z')-arGet(DATA,'position','HipCenter','z');
         delta_Hand_left_Hipcenter = [deltaX_Hand_left_Hipcenter,deltaY_Hand_left_Hipcenter,deltaZ_Hand_left_Hipcenter];
         NormalLH = sqrt(deltaX_Hand_left_Hipcenter^2+deltaY_Hand_left_Hipcenter^2,deltaZ_Hand_left_Hipcenter^2)

      
         deltaX_Elbow_left_Hipcenter = arGet(DATA,'position','ElbowLeft','x')-arGet(DATA,'position','HipCenter','x');
         deltaY_Elbow_left_Hipcenter = arGet(DATA,'position','ElbowLeft','y')-arGet(DATA,'position','HipCenter','y');
         deltaZ_Elbow_left_Hipcenter = arGet(DATA,'position','ElbowLeft','z')-arGet(DATA,'position','HipCenter','z');
         delta_Hand_left_Hipcenter = [deltaX_Hand_left_Hipcenter,deltaY_Hand_left_Hipcenter,deltaZ_Hand_left_Hipcenter];
         NormalLE = sqrt(deltaX_Elbow_left_Hipcenter^2+deltaY_Elbow_left_Hipcenter^2,deltaZ_Elbow_left_Hipcenter^2)


HipCenter= value=arGet(DATA,'position','HipCenter');

for=ii=1:numFV
   FV{ii}.name=FVname{ii};
   
   switch ii
       case 1
            FV{ii}.value=arGet(DATA,'angle','HipCenter'); %Angle
      
       case 2
            FV{ii}.value=arGet(DATA,'angle','Head');%Angle
            
       case 3
            FV{ii}.value=arGet(DATA,'angle','ShoulderRight');%Angle
            
       case 4
            FV{ii}.value=arGet(DATA,'angle','ShoulderLeft');   %Angle
        
       case 5
            FV{ii}.value=(arGet(DATA,'position','HandRight')-HipCenter)/NormalRH; %Position
       case 6
            FV{ii}.value=(arGet(DATA,'position','ElbowRight')-HipCenter)/NormalRE;%Position
            
       case 7
            FV{ii}.value=(arGet(DATA,'position','HandLeft')-HipCenter)/NormalLH;%Position
            
       case 8
            FV{ii}.value=(arGet(DATA,'position','ElbowLeft')-HipCenter)/NormalLE;%Position
            
                   
       otherwise
           
   end
   
   
   
   
end

