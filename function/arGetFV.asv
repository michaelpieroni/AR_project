function [ fv ] = arGetFV( data, fvName,varargin )
% Get data of the feature vector specify by fvName

fv=[];


switch fvName
    case {'multiple'}
        
    otherwise        
    for fi=1:length(data)
        if isfield(data{fi},'name')
            tmp_name=data{fi}.name; %get the name
            if strcmp(tmp_name,fvName)
                fv=getfield(data{fi},'value'); %get the value for the Feature Vector
                return
            end

        end
    end
end


