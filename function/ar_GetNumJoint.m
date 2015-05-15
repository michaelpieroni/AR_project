

function [output]=ar_GetNumJoint(input,varargin)

%input:  data structure!! 
if nargin >1
    numFrame=varargin{1};
else
    numFrame=1;
end

output=(size(input(numFrame,2:end),2))/3;