% Set the path to the folder containing the models
modelFolderPath = 'C:\Users\40523\Desktop\Path_specific\Models';
addpath(modelFolderPath);

% List all .slx files in the folder
modelFiles = dir(fullfile(modelFolderPath, '*.slx'));

% Loop through each model file and simulate it
for k = 1:length(modelFiles)
    modelFile = modelFiles(k).name;
    modelName = modelFile(1:end-4); % Remove the .slx extension

load_system(modelName);  
open_system(modelName);  

checkIDs = {'mathworks.jmaab.ar_0001', 'mathworks.jmaab.ar_0002',             
    'mathworks.jmaab.jc_0241', 'mathworks.jmaab.jc_0242',             
    'mathworks.jmaab.jc_0201', 'mathworks.jmaab.jc_0211',             
    'mathworks.jmaab.jc_0231', 'mathworks.jmaab.jc_0243',             
    'mathworks.jmaab.jc_0247', 'mathworks.jmaab.jc_0244',             
    'mathworks.jmaab.jc_0222', 'mathworks.jmaab.jc_0232',             
    'mathworks.jmaab.jc_0245', 'mathworks.jmaab.jc_0246',             
    'mathworks.jmaab.jc_0795', 'mathworks.jmaab.jc_0796',             
    'mathworks.jmaab.jc_0791', 'mathworks.jmaab.jc_0792',             
    'mathworks.jmaab.jc_0700', 'mathworks.maab.na_0019'};  
evalc('results = ModelAdvisor.run(modelName, checkIDs);')
end