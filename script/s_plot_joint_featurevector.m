

% CHECK  if load or not the DATA


if not(exist('data'))
    
    clear all
    close all

    %% In this script we compute the Feature Vector from orginal skeleton data


    %% STANDARD INITIALIZATION
    %%ADD path
    [relDir,dataDir]=arPath(arRootPath);
    addpath(relDir);
    % DO NOT add dataDir to avoid same several files with the same name


    %% Listo of subject to analyze
    Snum=[1];


    %% Listo of exp to analyze
    ExpN=1;

    for si=1:length(Snum)
        for ei=1:length(ExpN)
            [data]=arDataImport(dataDir,si,ei,'skeleton','angle&skeleton');

            numFrame=1;

            numJoint=arGet(data,'number of joint');
            dataPos=arGet(data,'position');


        end
    end
end


%% EXAMPLE : get position and coordinate
figure
[jointALL]=arGet(data,'position','all');
[ h ] = arPlotDataStream( jointALL,'position','all',[1:10]);


%% Compute ABU Feature Vector

[ FV ] = arFeatureVectorAbu( data );

%% Get a specific Feature Vector
FVname={'bodyOrient';'headOrient';'shoulderRightOrient';'shoulderleftOrient';
        'handRightPos';'elbowRightPos';'handLeftPos';'elbowLeftPos'};
    
fvSelect=FVname{2};
fv_test=arGet(FV,'FV',fvSelect);

close all
[ h ] = arPlotDataStream( FV,'feature vector','bodyOrient',[1:1830]);

[ h ] = arPlotDataStream( FV,'feature vector','all',[1:1830]);


figure
[ h ] = arPlotDataStream(jointALL,'position','all',[1:1830]);





