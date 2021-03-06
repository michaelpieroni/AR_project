function [ h ] = arPlotDataStream( data,datatype,nameList,frameRange,varargin )
%UNTITLED2 

%nameList= {name1; name2; name3; .....}

%INITIALIZE
legendList={};
numData=length(data); %number of data to plot
% 

if isempty(nameList)|| strcmp(nameList,'all')
    nData=length(data);
    labColor=colormap(hsv(nData.*3));
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
                     legendList=arPlotAppendLegend(legendList,data{di},datatype);
                     plot(vectFR,mData,'Color',labColor(di*3,:))
                        hold on 
                case [3]
                    mData=data{di}.value(vectFR,:); 
                    legendList=arPlotAppendLegend(legendList,data{di},datatype);
                    plot(vectFR,mData(:,1),'Color',labColor((di-1)*3+1,:))
                    hold on
                    plot(vectFR,mData(:,2),'Color',labColor((di-1)*3+2,:))
                    hold on
                    plot(vectFR,mData(:,3),'Color',labColor((di-1)*3+3,:))
                    hold on
                otherwise
                    warning (['The ',num2str(di),'th element has not be plotted'])
            end
        end
%         plot(vectFR,mData)
%         hold on                    
    end
else
    labColor=colormap(hsv(3));
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
                         
                        plot(vectFR,mData,'Color',labColor(1,:))
                        hold on    
                        
                    case [3]
                        mData=data{di}.value(vectFR,:); 
                        legendList=arPlotAppendLegend( legendList,data{di},datatype);
                        plot(vectFR,mData(:,1),'Color',labColor(1,:))
                        hold on
                        plot(vectFR,mData(:,2),'Color',labColor(2,:))
                        hold on
                        plot(vectFR,mData(:,3),'Color',labColor(3,:))
                        hold on
                        
                    otherwise
                        warning (['The ',num2str(di),'th element has not be plotted'])
                end
            end                
        end

    end
end

title ([datatype])
xlabel('# of frame')
ylabel('Absolute coordinate')
legend(legendList)


h=1;
