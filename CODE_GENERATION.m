modelFolderPath = 'C:\Users\40523\Desktop\Path_specific\Models';
addpath(modelFolderPath);

% List all .slx files in the folder
modelFiles = dir(fullfile(modelFolderPath, '*.slx'));

% Loop through each model file and simulate it
for k = 1:length(modelFiles)
    modelFile = modelFiles(k).name;
    modelName = modelFile(1:end-4); % Remove the .slx extension
 % Load the model    
load_system(modelName); 

open_system(modelName);  
set_param(modelName, 'SystemTargetFile', 'ert.tlc');  
set_param(modelName, 'Toolchain', 'MinGW64 | gmake (64-bit Windows)');  
set_param(modelName, 'Solver', 'FixedStepDiscrete');  
set_param(modelName, 'FixedStep', '0.1');  
rtwbuild(modelName);  
end