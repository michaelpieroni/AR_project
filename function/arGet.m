

function [output,varargout]=arGet(input,fieldname,varargin)




switch fieldname
    
    case{'number of joint';'numberofjoint';'numJoint'}
        if isfield(input,'nJoint')
            [output]=input.nJoint;
        else
            error('The input data does not have the field : number of joints')
        end
        
    case {'skeleton';'position'}
        % Get skeleton position in 3D coordinates
         if isfield(input,'position')
            [tmp]=getfield(input,'position');
        else
            error('The input data does not have the field : 3d position of the joint')
         end
         % if necessary get specific joint
         if nargin>2
             jointName=varargin{1};
             if nargin >3
                 jointCoord=varargin{2};
                 output1=arGetJointData(tmp,jointName,jointCoord); 
                 output=output1.value;
             else
                 output=arGetJointData(tmp,jointName);   
             end
         else
             output=tmp;
         end
         
         
     case {'angle'}
         if isfield(input,'angle')
            [tmp]=input.angle;
        else
            error('The input data does not have the field : angle for joint')
         end
        if nargin>2
             jointName=varargin{1};
             if nargin >3
                 jointCoord=varargin{2};
                 output1=arGetJointData(tmp,jointName,jointCoord); 
                 output=output1.value;
             else
                 output=arGetJointData(tmp,jointName);   
             end
         else
             output=tmp;
        end
         
    case {'FV';'Feature Vector'; 'featurevector'}
        if nargin>2
             fvName=varargin{1};             
             if nargin >3
                 coord=varargin{2};
                 output= arGetFV(input,fvName,coord);
             else
                 [output]=arGetFV(input,fvName);
             end
         else
             output=input;
             warning ('You did not specify a valid Feature Vector!')
         end
        
    otherwise
        error ([fieldnam,' is not VALID or it has not implemented yet'])
end
