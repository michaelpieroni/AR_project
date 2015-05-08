function [dataDir]=arDataDirectory(refDir,subNum,expNum,type_data)

%% Get the directory where are to find the data to analyze

dataDir=[refDir,'Sub',num2str(subNum),'\Ex',num2str(subNum)];

switch type_data
    
    case {'skeleton';'Skeleton\'}
        dataDir=[dataDir,'\Skeleton'];        
    case {'Feacture Vector';'FeactureVector';'feacture vector';'feacturevector';'FV'}
        dataDir=[dataDir,'\FeatureVector\'];       
    otherwise
        error([type_data,' is not accepted as input data type'])
end