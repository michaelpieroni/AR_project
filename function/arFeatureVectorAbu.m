function [ FV ] = arFeatureVectorAbu( DATA )
%ARFEATUREVECTORABU Summary of this function goes here
%   Detailed explanation goes here


FVname={'bodyOrient';'headOrient';'shoulderRightOrient';'shoulderleftOrient';
        'handRightPos';'elbowRightPos';'handLeftPos';'elbowLeftPos'};
numFV=8;
         deltaX_Hand_righ_Hipcenter = arGet(DATA,'position','HandRight','x')-arGet(DATA,'position','HipCenter','x');
         deltaY_Hand_righ_Hipcenter = arGet(DATA,'position','HandRight','y')-arGet(DATA,'position','HipCenter','y');
         deltaZ_Hand_righ_Hipcenter = arGet(DATA,'position','HandRight','z')-arGet(DATA,'position','HipCenter','z');
         delta_Hand_righ_Hipcenter = [deltaX_Hand_righ_Hipcenter,deltaY_Hand_righ_Hipcenter,deltaZ_Hand_righ_Hipcenter];
         NormalRH = sqrt(deltaX_Hand_righ_Hipcenter.^2+deltaY_Hand_righ_Hipcenter.^2+deltaZ_Hand_righ_Hipcenter.^2);

      
         deltaX_Elbow_right_Hipcenter = arGet(DATA,'position','ElbowRight','x')-arGet(DATA,'position','HipCenter','x');
         deltaY_Elbow_right_Hipcenter = arGet(DATA,'position','ElbowRight','y')-arGet(DATA,'position','HipCenter','y');
         deltaZ_Elbow_right_Hipcenter = arGet(DATA,'position','ElbowRight','z')-arGet(DATA,'position','HipCenter','z');
         delta_Hand_right_Hipcenter = [deltaX_Hand_righ_Hipcenter,deltaY_Hand_righ_Hipcenter,deltaZ_Hand_righ_Hipcenter];
         NormalRE = sqrt(deltaX_Elbow_right_Hipcenter.^2+deltaY_Elbow_right_Hipcenter.^2+deltaZ_Elbow_right_Hipcenter.^2);

      
         deltaX_Hand_left_Hipcenter = arGet(DATA,'position','HandLeft','x')-arGet(DATA,'position','HipCenter','x');
         deltaY_Hand_left_Hipcenter = arGet(DATA,'position','HandLeft','y')-arGet(DATA,'position','HipCenter','y');
         deltaZ_Hand_left_Hipcenter = arGet(DATA,'position','HandLeft','z')-arGet(DATA,'position','HipCenter','z');
         delta_Hand_left_Hipcenter = [deltaX_Hand_left_Hipcenter,deltaY_Hand_left_Hipcenter,deltaZ_Hand_left_Hipcenter];
         NormalLH = sqrt(deltaX_Hand_left_Hipcenter.^2+deltaY_Hand_left_Hipcenter.^2+deltaZ_Hand_left_Hipcenter.^2);

      
         deltaX_Elbow_left_Hipcenter = arGet(DATA,'position','ElbowLeft','x')-arGet(DATA,'position','HipCenter','x');
         deltaY_Elbow_left_Hipcenter = arGet(DATA,'position','ElbowLeft','y')-arGet(DATA,'position','HipCenter','y');
         deltaZ_Elbow_left_Hipcenter = arGet(DATA,'position','ElbowLeft','z')-arGet(DATA,'position','HipCenter','z');
         delta_Hand_left_Hipcenter = [deltaX_Hand_left_Hipcenter,deltaY_Hand_left_Hipcenter,deltaZ_Hand_left_Hipcenter];
         NormalLE = sqrt(deltaX_Elbow_left_Hipcenter.^2+deltaY_Elbow_left_Hipcenter.^2+deltaZ_Elbow_left_Hipcenter.^2);


HipCenter=arGet(DATA,'position','HipCenter');

for ii=1:numFV
   FV{ii}.name=FVname{ii};
   
   switch ii
       case 1
           dummy=arGet(DATA,'angle','HipCenter');
           FV{ii}.value=dummy.value;
%             FV{ii}.value=arGet(DATA,'angle','HipCenter'); %Angle
      
       case 2
           dummy=arGet(DATA,'angle','Head');
           FV{ii}.value=dummy.value;
%             FV{ii}.value=arGet(DATA,'angle','Head');%Angle
            
       case 3
           dummy=arGet(DATA,'angle','ShoulderRight');
           FV{ii}.value=dummy.value;
%             FV{ii}.value=arGet(DATA,'angle','ShoulderRight');%Angle
            
       case 4
           dummy=arGet(DATA,'angle','ShoulderLeft');
           FV{ii}.value=dummy.value;
%             FV{ii}.value=arGet(DATA,'angle','ShoulderLeft');   %Angle
        
       case 5
           dummy1=arGet(DATA,'position','HandRight');
           dummy=(dummy1.value-HipCenter.value)./[NormalRH,NormalRH,NormalRH]; %Position
           FV{ii}.value=dummy;
%            FV{ii}.value=(arGet(DATA,'position','HandRight')-HipCenter.value)./[NormalRH,NormalRH,NormalRH]; %Position
       case 6
           dummy1=(arGet(DATA,'position','ElbowRight'));
           dummy=(dummy1.value-HipCenter.value)./[NormalRE,NormalRE,NormalRE]; %Position
           FV{ii}.value=dummy;
%             FV{ii}.value=(arGet(DATA,'position','ElbowRight')-HipCenter.value)./[NormalRE,NormalRE,NormalRE]; %Position
            
       case 7
           dummy1=arGet(DATA,'position','HandLeft');
           dummy=(dummy1.value-HipCenter.value)./[NormalLH,NormalLH,NormalLH]; %Position
           FV{ii}.value=dummy;
%             FV{ii}.value=(arGet(DATA,'position','HandLeft')-HipCenter.value)./[NormalLH,NormalLH,NormalLH]; %Position
%             
       case 8
           dummy1=(arGet(DATA,'position','ElbowLeft'));
           dummy=(dummy1.value-HipCenter.value)./[NormalLE,NormalLE,NormalLE]; %Position
           FV{ii}.value=dummy;
%             FV{ii}.value=(arGet(DATA,'position','ElbowLeft')-HipCenter.value)./[NormalLE,NormalLE,NormalLE]; %Position
            
                   
       otherwise
           
   end
   
   
   
   
end

