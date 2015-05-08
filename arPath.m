function [varargout]=arPath(arDir)
% Set Matlab directory path for AR
%
%     arPath(arDir)
%
% Set up the path to the functions and data called by AR.  Place this
% function in a location that is in the Matlab path at start-up.  When
% you wish to initialize the AR path, or add a path for one of the
% tools boxes, call this function.
%
% Many people simply change to the AR root directory and type
% arPath(pwd)
%
% Another possibility is to include the ISET root directory on your
% path, and then invoke arPath(arRootPath).
%
% We recommend against putting the entire ISET distribution on your path,
% permanently. The reason is this:  Future distributions may change a
% directory organization. In that case, you may get path errors or other
% problems when you change distributions.
%
% Examples:
%   arDir = 'c:\myhome\Matlab\AR'; arPath(isetDir);
%   cd c:\myhome\Matlab\AR;          arPath(pwd);

fprintf('AR root directory: %s\n',arDir)

% Adds the root directory of the ISET tree to the user's path
addpath(arDir);

% Generates a list of the directories below the AR tree.
p = genpath(arRootPath);

% Adds all of the directories to the user's path.
addpath(p);

% Refreshes the path.
path(path);

%% Set output

if nargout>=1
    varargout{1}=arDir;
    if nargout>1
        % data directory: assumption 1 {project in \AR_project}; assumption
        % 2 {datafile all in \DATA arranged at 3 livels: liv1=> subject
        % [Sub1,Sub2,Subi,etc.]; liv2=> experiment [Ex1,Ex2,Exi,etc.]; liv3=> [FeatureVector, Skeleton]}
        
        dataDir=currDir(1:end-10); dataDir=[newDir,'DATA\'];
        varargout{2}=dataDir;
    end
        
end