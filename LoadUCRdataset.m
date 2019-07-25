function DS = LoadUCRdataset(datasetname)

    TRAIN = load(['/rigel/dsi/users/ikp2103/VLDBGRAIL/UCR2018/',datasetname,'/',datasetname,'_TRAIN']);
    TEST  = load(['/rigel/dsi/users/ikp2103/VLDBGRAIL/UCR2018/',datasetname,'/',datasetname,'_TEST']);

    %rng('default');
    %Train_numSamples = size(TRAIN,1);
    %TRAIN = TRAIN(randperm(Train_numSamples),:); % shuffle the data
    
    TRAIN_labels = TRAIN(:,1);
    TRAIN(:,1) = [];
    TEST_labels = TEST(:,1);
    TEST(:,1) = [];

    DS.TrainClassLabels = TRAIN_labels;
    DS.TestClassLabels = TEST_labels;
    DS.DataClassLabels = [TRAIN_labels;TEST_labels];

    DS.Train = TRAIN;
    DS.Test = TEST;
    DS.Data = [TRAIN;TEST];

    DS.ClassNames = unique(TRAIN_labels);

    DS.TrainInstancesCount = length(DS.Train(:,1));
    DS.TestInstancesCount = length(DS.Test(:,1));
    DS.DataInstancesCount = length(DS.Data(:,1));
end