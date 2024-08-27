% Set the path to the folder containing the models
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
    
    % Simulate the model
    simOut = sim(modelName, 'ReturnWorkspaceOutputs', 'on');
    
    % Check if the model has been simulated
    if ~isempty(simOut)
        disp([modelName, ' has been simulated']);
    else
        disp([modelName, ' has not been simulated']);
    end
    
    % Close the model
    close_system(modelName, 0);
end