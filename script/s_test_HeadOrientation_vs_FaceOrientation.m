
clear all
close all

data = importSDKvsFO('head-face-ori_Modified.txt');
t=1:size(data,1);

% Select Face Orientation data
in_FO=find(data(:,1)==0);
FO=data(in_FO,2:end);
t_FO=t(in_FO);

%Selection Head Orientation from SDK
in_SDK=find(data(:,1)==11);
FSDK=data(in_SDK,2:end);
t_SDK=t(in_SDK);


%Plot results
sel=1; %roll
figure,
plot(t_FO,FO(:,sel))
hold on
plot(t_SDK,FSDK(:,sel),'--')
title('Roll')
legend('Face Track','Head Orient SDK')


sel=2; %pitch
figure,
plot(t_FO,FO(:,sel))
hold on
plot(t_SDK,FSDK(:,sel),'--')
title('Pitch')
legend('Face Track','Head Orient SDK')


sel= 3; %yaw
figure,
plot(t_FO,FO(:,sel))
hold on
plot(t_SDK,FSDK(:,sel),'--')
title('Yaw')
legend('Face Track','Head Orient SDK')

% legend ('FO roll','FO pitch','FO yaw','FSDK roll','FSDK pitch','FSDK yaw')