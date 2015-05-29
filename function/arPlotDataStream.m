function [ h ] = arPlotDataStream( data,datatype,nameList,frameRange,varargin )
%UNTITLED2 

%nameList= {name1; name2; name3; .....}

%INITIALIZE
legendList={};
numData=length(data); %number of data to plot
% 

if isempty(nameList)|| strcmp(nameList,'all')
    for di=1:length(data)
        if isfield(data{di},'value')
            %% Check range
            dataFR=1:size(data{di}.value,1);
            if isempty(frameRange)
                vectFR=dataFR; %get the frame of data
            else
                inds=ismember(dataFR,frameRange); % indices of date included in the selection
                vectFR=dataFR(inds); %intersect input  and selected frame 
            end
            %%
            switch size(data{di}.value,2)
                case [1]
                    mData=data{di}.value(vectFR,:); 
%                     legendList{end+1}=[data{di}.name,'',data{di}.coord];
                     legendList=arPlotAppendLegend(legendList,data{di},datatype);
                case [3]
                    mData=data{di}.value(vectFR,:); 
%                     legendList{end+1}=[data{di}.name,'x'];
%                     legendList{end+1}=[data{di}.name,'y'];
%                     legendList{end+1}=[data{di}.name,'z'];
                    legendList=arPlotAppendLegend(legendList,data{di},datatype);
                otherwise
                    warning (['The ',num2str(di),'th element has not be plotted'])
            end
        end
        plot(vectFR,mData)
        hold on                    
    end
else
    for di=1:length(data)
        if any(any(strcmp(data{di}.name,nameList))) 
                if isfield(data{di},'value')
                    %% Check range
                dataFR=1:size(data{di}.value,1);
                if isempty(frameRange)
                    vectFR=dataFR; %get the frame of data
                else
                    inds=ismember(dataFR,frameRange); % indices of date included in the selection
                    vectFR=dataFR(inds); %intersect input  and selected frame 
                end
                %%
                switch size(data{di}.value,2)
                    case [1]
                        mData=data{di}.value(vectFR,:); 
                         legendList=arPlotAppendLegend( legendList,data{di},datatype);
                    case [3]
                        mData=data{di}.value(vectFR,:); 
                        legendList=arPlotAppendLegend( legendList,data{di},datatype);
                    otherwise
                        warning (['The ',num2str(di),'th element has not be plotted'])
                end
            end
            plot(vectFR,mData)
            hold on                    
        end

    end
end

title ([datatype])
xlabel('# of frame')
ylabel('Absolute coordinate')
legend(legendList)


h=1;
