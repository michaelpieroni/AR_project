function rootPath=arRootPath()
% Return the path to the root iset directory
%
% This function must reside in the directory at the base of the AR
% directory structure.  It is used to determine the location of various
% sub-directories.
% 
% Example:
%   fullfile(isetRootPath,'data')

rootPath=which('arRootPath');

[rootPath,fName,ext]=fileparts(rootPath);

return
