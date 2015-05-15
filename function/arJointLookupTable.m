function [ indices ] = arJointLookupTable( jointName )
%         
%         rtn[0] = JointType.FootRight;
%             rtn[1] = JointType.AnkleRight;
%             rtn[2] = JointType.KneeRight;
%             rtn[3] = JointType.HipRight;
%             rtn[4] = JointType.HipCenter;
%             rtn[5] = JointType.Spine;
%             rtn[6] = JointType.ShoulderCenter;
%             rtn[7] = JointType.ShoulderRight;
%             rtn[8] = JointType.ElbowRight;
%             rtn[9] = JointType.WristRight;
%             rtn[10] = JointType.HandRight;
%             rtn[11] = JointType.Head;
%             rtn[12] = JointType.HandLeft;
%             rtn[13] = JointType.WristLeft;
%             rtn[14] = JointType.ElbowLeft;
%             rtn[15] = JointType.ShoulderLeft;
%             rtn[16] = JointType.HipLeft;
%             rtn[17] = JointType.KneeLeft;
%             rtn[18] = JointType.AnkleLeft;
%             rtn[19] = JointType.FootLeft;
% [indices]=arJointLooupTable(jointName);

switch jointName
    case {'FootRight'},ind=1;
    case {'AnkleRight'},ind=2;
    case {'KneeRight'},ind=3;
    case {'HipRight'},ind=4;
    case {'HipCenter'},ind=5;
    case {'Spine'},ind=6;
    case {'ShoulderCenter'},ind=7;
    case {'ShoulderRight'},ind=8;
    case {'ElbowRight'},ind=9;
    case {'WristRight'},ind=10;
    case {'HandRight'},ind=11;
    case {'Head'},ind=12;
    case {'HandLeft'},ind=13;
    case {'WristLeft'},ind=14;
    case {'ElbowLeft'},ind=15;
    case {'ShoulderLeft'},ind=16;
    case {'HipLeft'},ind=17;
    case {'KneeLeft'},ind=18;
    case {'AnkleLeft'},ind=9;
    case {'FootLeft'},ind=10;
        
    otherwise
        error ([jointName,' is not valid as joint name'])
end

%relative index mapping for x/roll,y/pitch,z/yaw
v0=[-1,0,+1];

indices=ind*3+v0;



end

