
function [data]=arDataImport(refDir,subNum,expNum,folderType,type_data,varargin)

% Get
[dataDir]=arDataDirectory(refDir,subNum,expNum,folderType);

cd_old=cd(dataDir);
switch type_data
        case {'skeleton';'Skeleton';'ALLDATA';'position'}
            refC='A';
        case {'Angle'; 'angle'}
%             error ('This function to get angle of the skeleton has to be completed')
            refC='s';
        case {'Feature Vectur';'FeatureVector'}
            refC='1';            
        case {'angle&skeleton'}
          refD1='s';
          refD2= 'A';
          refC=[];
    otherwise
            error ([type_data,' is not a valid type of data'])
end

files=dir(dataDir);

if not(isempty(refC))
    % Get only specific type of data (Angle or Position)
    for fi=1:size(files,1)
        fname=files(fi,1).name;
        if length (fname)>5
            stringC=fname(end-4);    
            if strcmp(stringC,refC)
                data=ar_importfile(fname);
            end
        end
    end
    
else
    %IMPORT data for ANGLE
    for fi=1:size(files,1)
        fname=files(fi,1).name;
        if length (fname)>5
            stringC=fname(end-4);    
            if strcmp(stringC,refD1)
                data.angle=ar_importfile(fname);
            end
        end
    end
     for fi=1:size(files,1)
        fname=files(fi,1).name;
        if length (fname)>5
            stringC=fname(end-4);    
            if strcmp(stringC,refD2)
                data.position=ar_importfile(fname);
            end
        end
     end
    
     %Check number of joint
     numFrame=1;
     nJoint1=(size(data.position(numFrame,2:end),2))/3;
     nJoint2=(size(data.angle(numFrame,2:end),2))/3;
     if nJoint1==nJoint2
         data.nJoint=nJoint1;
     else
         warning('Inconsistent number of joints for position and angle')
         data.nJoint=[];
     end       
    
    
end

cd(cd_old);