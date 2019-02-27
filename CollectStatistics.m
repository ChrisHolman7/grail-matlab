function CollectStatistics(DataSetStartIndex, DataSetEndIndex)  

    % first 2 values are '.' and '..' - UCR Archive 2018 version has 128 datasets
    dir_struct = dir('/rigel/dsi/users/ikp2103/JOPA/GRAIL2/UCR2018/');
    Datasets = {dir_struct(3:130).name};
                     
    % Sort Datasets
    
    [Datasets, DSOrder] = sort(Datasets);
    
    
    FourierEnergy = 1;
    DatasetPercentile = 100;
    
    for i = 1:length(Datasets)

            if (i>=DataSetStartIndex && i<=DataSetEndIndex)

                    disp(['Dataset being processed: ', char(Datasets(i))]);
                    %DS = LoadUCRdataset(char(Datasets(i)));
                    %disp([char(Datasets(i)),',',num2str(length(DS.ClassNames)),',',num2str(DS.TrainInstancesCount),',',num2str(DS.TestInstancesCount),',',num2str(length(DS.Train(1,:)))]);
                    
                    ResultsTmp = dlmread( strcat( 'RunClassificationZREP/RunClassificationZREP_FULLKM_Z10_KShape_', num2str(i),'.results') );
                    
                    Results(i,:) = ResultsTmp(i,:);
                    
            end
                    
           
    end
            
    dlmwrite( strcat( '/rigel/dsi/users/ikp2103/JOPA/GRAIL2/RESULTS/RunClassificationZREP_FULLKM_Z10_KShape_', num2str(DataSetStartIndex), '_', num2str(DataSetEndIndex)), Results, 'delimiter', ',');
    
end
