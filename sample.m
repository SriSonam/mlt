% Boolean Function Representation using Feedforward Neural Network
clc; clear;

% Define the input and target values
inputs = [0 0; 0 1; 1 0; 1 1]'; % Inputs as columns (2x4 for AND, OR, XOR)
targets_and = [0 0 0 1];         % AND truth table
targets_or = [0 1 1 1];          % OR truth table
targets_xor = [0 1 1 0];         % XOR truth table
targets_not = [1 0];             % NOT truth table

% Select the function to train (Change to targets_and, targets_or, etc.)
selected_target = targets_xor;

% Adjust for NOT function (since it uses single input and output)
if isequal(selected_target, targets_not)
    inputs = [0; 1]';            % Single input for NOT
    selected_target = targets_not; % Update target
end

% Create a feedforward neural network
hiddenLayerSize = 3;             % Number of neurons in the hidden layer
net = feedforwardnet(hiddenLayerSize); % Create feedforward neural network

% Configure the neural network
net.trainParam.epochs = 1000;    % Maximum training epochs
net.trainParam.lr = 0.1;         % Learning rate
net.trainParam.goal = 0.001;     % Error goal

% Train the neural network
net = train(net, inputs, selected_target);

% Test the trained network
outputs = net(inputs);           % Get outputs for inputs
predicted = round(outputs);      % Round the outputs to binary (0 or 1)

% Display results
disp('Inputs:');
disp(inputs');
disp('Expected Outputs:');
disp(selected_target');
disp('Predicted Outputs:');
disp(predicted');