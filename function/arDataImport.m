
function [data]=arDataImport(refDir,subNum,expNum,folderType,type_data,varargin)

% Get
[dataDir]=arDataDirectory(refDir,subNum,expNum,folderType);

cd_old=cd(dataDir);
switch type_data
        case {'skeleton';'Skeleton'}
            refC='A';
        case {'Angle'; 'angle'}
%             error ('This function to get angle of the skeleton has to be completed')
            refC='s';
        case {'Feature Vectur';'FeatureVector'}
            refC='1';
        otherwise
        error ([type_data,' is not a valid type of data'])
    end

files=dir(dataDir);

for fi=1:size(files,1)
    fname=files(fi,1).name;
    if length (fname)>5
        stringC=fname(end-4);    
        if strcmp(stringC,refC)
            data=ar_importfile(fname);

        end
    end
end

cd(cd_old);