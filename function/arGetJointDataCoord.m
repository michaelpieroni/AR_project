function [ output ] = arGetJointDataCoord( data,indices,coordName )
%UNTITLED 
switch coordName
    case {'x','roll'}
        output=data(:,indices(1));
    case {'y','pitch'}
        output=data(:,indices(2));
    case {'z','yaw'}
    output=data(:,indices(3)); 

    otherwise
        error('Not valid type of coordinate for the joint')
end
        
