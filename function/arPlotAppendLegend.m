function [ legendList ] = arPlotAppendLegend( legendList,dataIN,datatype)
%UNTITLED3 

if isfield(dataIN,'value')
    switch size(dataIN.value,2)
        case 1            
            numElem=size(dataIN.value,2);
        case 3
            numElem=size(dataIN.value,2);
        otherwise
            legendList{end+1}=[];
            return
    end
    
else
    legendList{end+1}=[];
    return
end


switch datatype
    case{'skeleton';'position'}
        switch numElem
            case 1
                legendList{end+1}=[dataIN.name,'',dataIN.coord];
            case 3
                legendList{end+1}=[dataIN.name,' X'];
                legendList{end+1}=[dataIN.name,' Y'];
                legendList{end+1}=[dataIN.name,' Z'];
            otherwise
                legendList{end+1}=[];
                return  
        end
    case {'angle'}
        switch numElem
            case 1
                legendList{end+1}=[dataIN.name,'',data{di}.coord];
            case 3
                legendList{end+1}=[dataIN.name,' roll'];
                legendList{end+1}=[dataIN.name,' pitch'];
                legendList{end+1}=[dataIN.name,' yaw'];
            otherwise
                legendList{end+1}=[];
                return  
        end
    case{'feature vector'}
        switch numElem
            case 1
                legendList{end+1}=[dataIN.name,'',data{di}.coord];
            case 3
                legendList{end+1}=[dataIN.name,' FV1'];
                legendList{end+1}=[dataIN.name,' FV2'];
                legendList{end+1}=[dataIN.name,' FV3'];
            otherwise
                legendList{end+1}=[];
                return 
        end
    otherwise
        warning ([datatype, ' is not a valid DATA type for plotting'])
    
end

end

