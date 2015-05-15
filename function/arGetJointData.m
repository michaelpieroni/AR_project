function [ output ] = arGetJointData( data,jointName,varargin )
% Data: instances x joints
[indices]=arJointLookupTable(jointName);


if nargin>2
    switch varargin{1}
        case {'x','roll'}
            output=data(:,indices(1));
        case {'y','pitch'}
            output=data(:,indices(2));
        case {'z','yaw'}
        output=data(:,indices(3)); 
        
        otherwise
            error('Not valid type of coordinate for the joint')
    end
else

    % x coord or roll
    output(:,1)=data(:,indices(1));
    % y coord or pitch
    output(:,2)=data(:,indices(2));
    % z coord or yaw
    output(:,3)=data(:,indices(3));

end

end

