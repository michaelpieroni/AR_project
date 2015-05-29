function [ output ] = arGetJointData( data,jointName,varargin )


switch jointName
    case {'all'}
        jointListName={'FootRight';'AnkleRight';'KneeRight';'HipRight';'HipCenter';'Spine';'ShoulderCenter';'ShoulderRight';...
            'ElbowRight';'WristRight';'HandRight';'Head';'HandLeft';'WristLeft';'ElbowLeft';'ShoulderLeft';'HipLeft';'KneeLeft';...
            'AnkleLeft';'FootLeft'};
        
        for ji=1:length(jointListName)
            if nargin>2
                [ output{ji} ] = arGetJointData( data,jointListName{ji},varargin{1});
                output{ji}.coord=[varargin{1}];
                output{ji}.name=jointListName{ji};
            else
                [ output{ji} ] = arGetJointData( data,jointListName{ji});
                output{ji}.value
                output{ji}.coord=['all'];
            end
        end
    otherwise
        % Data: instances x joints
        [indices]=arJointLookupTable(jointName);
        output.name=jointName;
        if nargin>2               
            output.coord=[varargin{1}];
            output.value= arGetJointDataCoord(data,indices,output.coord);   
        else

            % x coord or roll
            output.value(:,1)=data(:,indices(1));
            % y coord or pitch
            output.value(:,2)=data(:,indices(2));
            % z coord or yaw
            output.value(:,3)=data(:,indices(3));
            output.coord=['all'];
    end

end
end



