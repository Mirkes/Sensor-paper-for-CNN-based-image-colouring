% This sript is organised as life script or notebook
% each section can be executed separately by presing Ctrl+Enter
%
% Please set the current folder to folder with tif files with all required
% data by command like 
%   cd 'tif_data'

%% Constant definition
% Please print the size of inputs for CNN (parameter k); 
% k might be equal to 3;5;7;9;11;13;15. 
% For k=3, due to sizes of intermediate CNN outputs, it is necessary to
% close lines 235-237, % 278-280, and 321-323
k = 5 

%% This section are for uploading and arranging the layers of the cities. 
alan_atlanta=imread('alan_atlanta.tif');
red_atlanta=imread('red_atlanta.tif');
green_atlanta=imread('green_atlanta.tif');
blue_atlanta=imread('blue_atlanta.tif');
avghbase_atlanta=imread('avgHBASE_atlanta.tif');
sdhbase_atlanta=imread('sdHBASE_atlanta.tif');
cube_atlanta=cat(6,alan_atlanta,avghbase_atlanta,sdhbase_atlanta,red_atlanta,green_atlanta,blue_atlanta);
cube_atlanta=cat(6,cast(alan_atlanta,'single')/704,avghbase_atlanta/100,sdhbase_atlanta/50,red_atlanta,green_atlanta,blue_atlanta); % normalization for the 0-1 diapason

alan_beijing=imread('alan_beijing.tif');
red_beijing=imread('red_beijing.tif');
green_beijing=imread('green_beijing.tif');
blue_beijing=imread('blue_beijing.tif');
avghbase_beijing=imread('avgHBASE_beijing.tif');
sdhbase_beijing=imread('sdHBASE_beijing.tif');
cube_beijing=cat(6,alan_beijing,avghbase_beijing,sdhbase_beijing,red_beijing,green_beijing,blue_beijing);
cube_beijing=cat(6,cast(alan_beijing,'single')/704,avghbase_beijing/100,sdhbase_beijing/50,red_beijing,green_beijing,blue_beijing); % normalization for the 0-1 diapason

alan_haifa=imread('alan_haifa.tif');
red_haifa=imread('red_haifa.tif');
green_haifa=imread('green_haifa.tif');
blue_haifa=imread('blue_haifa.tif');
avghbase_haifa=imread('avgHBASE_haifa.tif');
sdhbase_haifa=imread('sdHBASE_haifa.tif');
cube_haifa=cat(6,alan_haifa,avghbase_haifa,sdhbase_haifa,red_haifa,green_haifa,blue_haifa);
cube_haifa=cat(6,cast(alan_haifa,'single')/704,avghbase_haifa/100,sdhbase_haifa/50,red_haifa,green_haifa,blue_haifa); % normalization for the 0-1 diapason

alan_khabarovsk=imread('alan_khab.tif');
red_khabarovsk=imread('red_khab.tif');
green_khabarovsk=imread('green_khab.tif');
blue_khabarovsk=imread('blue_khab.tif');
avghbase_khabarovsk=imread('avgHBASE_khab.tif');
sdhbase_khabarovsk=imread('sdHBASE_khab.tif');
cube_khabarovsk=cat(6,alan_khabarovsk,avghbase_khabarovsk,sdhbase_khabarovsk,red_khabarovsk,green_khabarovsk,blue_khabarovsk);
cube_khabarovsk=cat(6,cast(alan_khabarovsk,'single')/704,avghbase_khabarovsk/100,sdhbase_khabarovsk/50,red_khabarovsk,green_khabarovsk,blue_khabarovsk); % normalization for the 0-1 diapason

alan_london=imread('alan_london.tif');
red_london=imread('red_london.tif');
green_london=imread('green_london.tif');
blue_london=imread('blue_london.tif');
avghbase_london=imread('avgHBASE_london.tif');
sdhbase_london=imread('sdHBASE_london.tif');
cube_london=cat(6,alan_london,avghbase_london,sdhbase_london,red_london,green_london,blue_london);
cube_london=cat(6,cast(alan_london,'single')/704,avghbase_london/100,sdhbase_london/50,red_london,green_london,blue_london); % normalization for the 0-1 diapason

alan_naples=imread('alan_naples.tif');
red_naples=imread('red_naples.tif');
green_naples=imread('green_naples.tif');
blue_naples=imread('blue_naples.tif');
avghbase_naples=imread('avgHBASE_naples.tif');
sdhbase_naples=imread('sdHBASE_naples.tif');
cube_naples=cat(6,alan_naples,avghbase_naples,sdhbase_naples,red_naples,green_naples,blue_naples);
cube_naples=cat(6,cast(alan_naples,'single')/704,avghbase_naples/100,sdhbase_naples/50,red_naples,green_naples,blue_naples); % normalization for the 0-1 diapason

alan_nashville=imread('alan_nash.tif');
red_nashville=imread('red_nash.tif');
green_nashville=imread('green_nash.tif');
blue_nashville=imread('blue_nash.tif');
avghbase_nashville=imread('avgHBASE_nash.tif');
sdhbase_nashville=imread('sdHBASE_nash.tif');
cube_nashville=cat(6,alan_nashville,avghbase_nashville,sdhbase_nashville,red_nashville,green_nashville,blue_nashville);
cube_nashville=cat(6,cast(alan_nashville,'single')/704,avghbase_nashville/100,sdhbase_nashville/50,red_nashville,green_nashville,blue_nashville); % normalization for the 0-1 diapason

alan_tianjing=imread('alan_tianjing.tif');
red_tianjing=imread('red_tianjing.tif');
green_tianjing=imread('green_tianjing.tif');
blue_tianjing=imread('blue_tianjing.tif');
avghbase_tianjing=imread('avgHBASE_tianjing.tif');
sdhbase_tianjing=imread('sdHBASE_tianjing.tif');
cube_tianjing=cat(6,alan_tianjing,avghbase_tianjing,sdhbase_tianjing,red_tianjing,green_tianjing,blue_tianjing);
cube_tianjing=cat(6,cast(alan_tianjing,'single')/704,avghbase_tianjing/100,sdhbase_tianjing/50,red_tianjing,green_tianjing,blue_tianjing); % normalization for the 0-1 diapason



%% This section are for slicing the initial images into input data pieces of k*k size
Nimages_atlanta = (size(cube_atlanta,1) - (k-1)) * (size(cube_atlanta,2) - (k-1))
X_atlanta = zeros(k, k, 3, 1, Nimages_atlanta);
Yred_atlanta = [];
Ygreen_atlanta = [];
Yblue_atlanta = [];
i_image = 0;
for i = (1+0.5*(k-1)):(size(cube_atlanta,1)-(0.5*(k-1)))
    for j = (1+0.5*(k-1)):(size(cube_atlanta,2)-(0.5*(k-1)))
        i_image = i_image + 1
        cube1 = cube_atlanta((i-0.5*(k-1)):(i+0.5*(k-1)),(j-0.5*(k-1)):(j+0.5*(k-1)),1:3);
        X_atlanta(:,:,:,1,i_image) = cube1;
        Yred_atlanta = [Yred_atlanta; cube_atlanta(i,j,4)];
        Ygreen_atlanta = [Ygreen_atlanta; cube_atlanta(i,j,5)];
        Yblue_atlanta = [Yblue_atlanta; cube_atlanta(i,j,6)];        
    end
end

Nimages_beijing = (size(cube_beijing,1) - (k-1)) * (size(cube_beijing,2) - (k-1))
X_beijing = zeros(k, k, 3, 1, Nimages_beijing);
Yred_beijing = [];
Ygreen_beijing = [];
Yblue_beijing = [];
i_image = 0;
for i = (1+0.5*(k-1)):(size(cube_beijing,1)-(0.5*(k-1)))
    for j = (1+0.5*(k-1)):(size(cube_beijing,2)-(0.5*(k-1)))
        i_image = i_image + 1
        cube1 = cube_beijing((i-0.5*(k-1)):(i+0.5*(k-1)),(j-0.5*(k-1)):(j+0.5*(k-1)),1:3);
        X_beijing(:,:,:,1,i_image) = cube1;
        Yred_beijing = [Yred_beijing; cube_beijing(i,j,4)];
        Ygreen_beijing = [Ygreen_beijing; cube_beijing(i,j,5)];
        Yblue_beijing = [Yblue_beijing; cube_beijing(i,j,6)];        
    end
end

Nimages_haifa = (size(cube_haifa,1) - (k-1)) * (size(cube_haifa,2) - (k-1))
X_haifa = zeros(k, k, 3, 1, Nimages_haifa);
Yred_haifa = [];
Ygreen_haifa = [];
Yblue_haifa = [];
i_image = 0;
for i = (1+0.5*(k-1)):(size(cube_haifa,1)-(0.5*(k-1)))
    for j = (1+0.5*(k-1)):(size(cube_haifa,2)-(0.5*(k-1)))
        i_image = i_image + 1
        cube1 = cube_haifa((i-0.5*(k-1)):(i+0.5*(k-1)),(j-0.5*(k-1)):(j+0.5*(k-1)),1:3);
        X_haifa(:,:,:,1,i_image) = cube1;
        Yred_haifa = [Yred_haifa; cube_haifa(i,j,4)];
        Ygreen_haifa = [Ygreen_haifa; cube_haifa(i,j,5)];
        Yblue_haifa = [Yblue_haifa; cube_haifa(i,j,6)];        
    end
end

Nimages_khabarovsk = (size(cube_khabarovsk,1) - (k-1)) * (size(cube_khabarovsk,2) - (k-1))
X_khabarovsk = zeros(k, k, 3, 1, Nimages_khabarovsk);
Yred_khabarovsk = [];
Ygreen_khabarovsk = [];
Yblue_khabarovsk = [];
i_image = 0;
for i = (1+0.5*(k-1)):(size(cube_khabarovsk,1)-(0.5*(k-1)))
    for j = (1+0.5*(k-1)):(size(cube_khabarovsk,2)-(0.5*(k-1)))
        i_image = i_image + 1
        cube1 = cube_khabarovsk((i-0.5*(k-1)):(i+0.5*(k-1)),(j-0.5*(k-1)):(j+0.5*(k-1)),1:3);
        X_khabarovsk(:,:,:,1,i_image) = cube1;
        Yred_khabarovsk = [Yred_khabarovsk; cube_khabarovsk(i,j,4)];
        Ygreen_khabarovsk = [Ygreen_khabarovsk; cube_khabarovsk(i,j,5)];
        Yblue_khabarovsk = [Yblue_khabarovsk; cube_khabarovsk(i,j,6)];        
    end
end

Nimages_london = (size(cube_london,1) - (k-1)) * (size(cube_london,2) - (k-1))
X_london = zeros(k, k, 3, 1, Nimages_london);
Yred_london = [];
Ygreen_london = [];
Yblue_london = [];
i_image = 0;
for i = (1+0.5*(k-1)):(size(cube_london,1)-(0.5*(k-1)))
    for j = (1+0.5*(k-1)):(size(cube_london,2)-(0.5*(k-1)))
        i_image = i_image + 1
        cube1 = cube_london((i-0.5*(k-1)):(i+0.5*(k-1)),(j-0.5*(k-1)):(j+0.5*(k-1)),1:3);
        X_london(:,:,:,1,i_image) = cube1;
        Yred_london = [Yred_london; cube_london(i,j,4)];
        Ygreen_london = [Ygreen_london; cube_london(i,j,5)];
        Yblue_london = [Yblue_london; cube_london(i,j,6)];        
    end
end

Nimages_naples = (size(cube_naples,1) - (k-1)) * (size(cube_naples,2) - (k-1))
X_naples = zeros(k, k, 3, 1, Nimages_naples);
Yred_naples = [];
Ygreen_naples = [];
Yblue_naples = [];
i_image = 0;
for i = (1+0.5*(k-1)):(size(cube_naples,1)-(0.5*(k-1)))
    for j = (1+0.5*(k-1)):(size(cube_naples,2)-(0.5*(k-1)))
        i_image = i_image + 1
        cube1 = cube_naples((i-0.5*(k-1)):(i+0.5*(k-1)),(j-0.5*(k-1)):(j+0.5*(k-1)),1:3);
        X_naples(:,:,:,1,i_image) = cube1;
        Yred_naples = [Yred_naples; cube_naples(i,j,4)];
        Ygreen_naples = [Ygreen_naples; cube_naples(i,j,5)];
        Yblue_naples = [Yblue_naples; cube_naples(i,j,6)];        
    end
end

Nimages_nashville = (size(cube_nashville,1) - (k-1)) * (size(cube_nashville,2) - (k-1))
X_nashville = zeros(k, k, 3, 1, Nimages_nashville);
Yred_nashville = [];
Ygreen_nashville = [];
Yblue_nashville = [];
i_image = 0;
for i = (1+0.5*(k-1)):(size(cube_nashville,1)-(0.5*(k-1)))
    for j = (1+0.5*(k-1)):(size(cube_nashville,2)-(0.5*(k-1)))
        i_image = i_image + 1
        cube1 = cube_nashville((i-0.5*(k-1)):(i+0.5*(k-1)),(j-0.5*(k-1)):(j+0.5*(k-1)),1:3);
        X_nashville(:,:,:,1,i_image) = cube1;
        Yred_nashville = [Yred_nashville; cube_nashville(i,j,4)];
        Ygreen_nashville = [Ygreen_nashville; cube_nashville(i,j,5)];
        Yblue_nashville = [Yblue_nashville; cube_nashville(i,j,6)];        
    end
end

Nimages_tianjing = (size(cube_tianjing,1) - (k-1)) * (size(cube_tianjing,2) - (k-1))
X_tianjing = zeros(k, k, 3, 1, Nimages_tianjing);
Yred_tianjing = [];
Ygreen_tianjing = [];
Yblue_tianjing = [];
i_image = 0;
for i = (1+0.5*(k-1)):(size(cube_tianjing,1)-(0.5*(k-1)))
    for j = (1+0.5*(k-1)):(size(cube_tianjing,2)-(0.5*(k-1)))
        i_image = i_image + 1
        cube1 = cube_tianjing((i-0.5*(k-1)):(i+0.5*(k-1)),(j-0.5*(k-1)):(j+0.5*(k-1)),1:3);
        X_tianjing(:,:,:,1,i_image) = cube1;
        Yred_tianjing = [Yred_tianjing; cube_tianjing(i,j,4)];
        Ygreen_tianjing = [Ygreen_tianjing; cube_tianjing(i,j,5)];
        Yblue_tianjing = [Yblue_tianjing; cube_tianjing(i,j,6)];        
    end
end

% Lines 222-225 are for forming the arrays of CNN inputs 
X_5D = {X_atlanta; X_beijing; X_haifa; X_khabarovsk; X_london; X_naples; X_nashville; X_tianjing};
Yred = {Yred_atlanta; Yred_beijing; Yred_haifa; Yred_khabarovsk; Yred_london; Yred_naples; Yred_nashville; Yred_tianjing};
Ygreen = {Ygreen_atlanta; Ygreen_beijing; Ygreen_haifa; Ygreen_khabarovsk; Ygreen_london; Ygreen_naples; Ygreen_nashville; Ygreen_tianjing};
Yblue = {Yblue_atlanta; Yblue_beijing; Yblue_haifa; Yblue_khabarovsk; Yblue_london; Yblue_naples; Yblue_nashville; Yblue_tianjing};

% Red
%
%% This section describes the layers of the CNN
layers = [
    image3dInputLayer([k k 3])
    convolution3dLayer([3 3 3],64,'Stride',1)
    batchNormalizationLayer
    reluLayer
    convolution3dLayer([3 3 1],4,'Stride',1)
    batchNormalizationLayer
    reluLayer
    fullyConnectedLayer(1)
    regressionLayer];

%% This section performs training and testing the CNN for red lights
wmse_red = zeros(8); % Weighted mean squared error (wmse) as performance metric of the CNN
correl_red = zeros(8); % Pearson's correlation (correl) as performance metric of the CNN
for i = 1:8 % number of training sets
    for j = 1:8 % number of testing sets
    X_train = X_5D{i};
    Y_train = Yred{i};
    X_validation = X_5D{j};
    Y_validation = Yred{j};
    options = trainingOptions('sgdm', ...
        'MiniBatchSize',128, ...
        'MaxEpochs',50, ...
        'InitialLearnRate',1e-3, ...
        'LearnRateSchedule','piecewise', ...
        'LearnRateDropFactor',0.1, ...
        'LearnRateDropPeriod',20, ...
        'Shuffle','every-epoch', ...
        'ValidationData',{X_validation,Y_validation}, ... 
        'ValidationFrequency',20, ...
        'Plots','training-progress', ...
        'Verbose',false);
    rng(0)
    net = trainNetwork(X_train,Y_train,layers,options);
    delete(findall(0));
    YPredicted = predict(net,X_validation);
    predictionError = (Y_validation - YPredicted)./Y_validation;
    squares = predictionError.^2;
    wmse_red(i,j) = sqrt(mean(squares));
    correl_red(i,j) = corr(Y_validation,YPredicted);
    end
end

% Green
%
%% This section describes the layers of the CNN
layers = [
    image3dInputLayer([k k 3])
    convolution3dLayer([3 3 3],64,'Stride',1)
    batchNormalizationLayer
    reluLayer
    convolution3dLayer([3 3 1],4,'Stride',1)
    batchNormalizationLayer
    reluLayer
    fullyConnectedLayer(1)
    regressionLayer];

%% This section performs training and testing the CNN for green lights
wmse_green = zeros(8); % Weighted mean squared error (wmse) as performance metric of the CNN
correl_green = zeros(8); % Pearson's correlation (correl) as performance metric of the CNN
for i = 1:8 % number of training sets
    for j = 1:8 % number of testing sets
    X_train = X_5D{i};
    Y_train = Ygreen{i};
    X_validation = X_5D{j};
    Y_validation = Ygreen{j};
    options = trainingOptions('sgdm', ...
        'MiniBatchSize',128, ...
        'MaxEpochs',50, ...
        'InitialLearnRate',1e-3, ...
        'LearnRateSchedule','piecewise', ...
        'LearnRateDropFactor',0.1, ...
        'LearnRateDropPeriod',20, ...
        'Shuffle','every-epoch', ...
        'ValidationData',{X_validation,Y_validation}, ... 
        'ValidationFrequency',20, ...
        'Plots','training-progress', ...
        'Verbose',false);
    rng(0)
    net = trainNetwork(X_train,Y_train,layers,options);
    delete(findall(0));
    YPredicted = predict(net,X_validation);
    predictionError = (Y_validation - YPredicted)./Y_validation;
    squares = predictionError.^2;
    wmse_green(i,j) = sqrt(mean(squares));
    correl_green(i,j) = corr(Y_validation,YPredicted);
    end
end

% Blue
%
%% This section describes the layers of the CNN
layers = [
    image3dInputLayer([k k 3])
    convolution3dLayer([3 3 3],64,'Stride',1)
    batchNormalizationLayer
    reluLayer
    convolution3dLayer([3 3 1],4,'Stride',1)
    batchNormalizationLayer
    reluLayer
    fullyConnectedLayer(1)
    regressionLayer];
%% This section performs training and testing the CNN for blue lights
wmse_blue = zeros(8); % Weighted mean squared error (wmse) as performance metric of the CNN
correl_blue = zeros(8); % Pearson's correlation (correl) as performance metric of the CNN
for i = 1:8 % number of training sets
    for j = 1:8 % number of testing sets
    X_train = X_5D{i};
    Y_train = Yblue{i};
    X_validation = X_5D{j};
    Y_validation = Yblue{j};
    options = trainingOptions('sgdm', ...
        'MiniBatchSize',128, ...
        'MaxEpochs',50, ...
        'InitialLearnRate',1e-3, ...
        'LearnRateSchedule','piecewise', ...
        'LearnRateDropFactor',0.1, ...
        'LearnRateDropPeriod',20, ...
        'Shuffle','every-epoch', ...
        'ValidationData',{X_validation,Y_validation}, ... 
        'ValidationFrequency',20, ...
        'Plots','training-progress', ...
        'Verbose',false);
    rng(0)
    net = trainNetwork(X_train,Y_train,layers,options);
    delete(findall(0));
    YPredicted = predict(net,X_validation);
    predictionError = (Y_validation - YPredicted)./Y_validation;
    squares = predictionError.^2;
    wmse_blue(i,j) = sqrt(mean(squares));
    correl_blue(i,j) = corr(Y_validation,YPredicted);
    end
end