%% ImageAlign
% ImageAlign is a program the takes 3 sets of TIFF images and allows the
% user to verify microscope allignment
%% File selection
global prompt_time %The time point that is being prompted for
prompt_time = 'Please select the 0-hour puncta overlay folder.';
folderprompt();
cur_path = uigetdir;
hr0_filenames = dir(strcat(cur_path, '\*.tif'));
hr0_filenames = extractfield(hr0_filenames, 'name');
imageNames = hr0_filenames;
hr0_filenames = strcat(cur_path,'\', hr0_filenames);
prompt_time = 'Please select the 24-hour puncta overlay folder.';
folderprompt();
cur_path = uigetdir(cur_path);
hr24_filenames = dir(strcat(cur_path, '\*.tif'));
hr24_filenames = extractfield(hr24_filenames, 'name');
hr24_filenames = strcat(cur_path,'\', hr24_filenames);
prompt_time = 'Please select the 48-hour puncta overlay folder.';
folderprompt();
cur_path = uigetdir(cur_path);
hr48_filenames = dir(strcat(cur_path, '\*.tif'));
hr48_filenames = extractfield(hr48_filenames, 'name');
hr48_filenames = strcat(cur_path,'\', hr48_filenames);

    
%% Shows user window with images and allows them to validate/comment
for n = 1:length(hr24_filenames)
    global count % How many allignments analyzed
    global cur_0 % Current 0-hour image
    global cur_24 % Current 24-hour image
    global cur_48 % Current 48-hour image
    global comment % User's comment
    global validity % User's validation (yes/no/maybe)
    % Sets all variables to the current dataset
    count = [num2str(n), ' of ', num2str(length(hr24_filenames))];
    cur_0 = imread(hr0_filenames{n});
    cur_24 = imread(hr24_filenames{n});
    cur_48 = imread(hr48_filenames{n}); 
    slidingDisplay(); % opens the user gui with all respective variables 
    % Adds user input to results
    results(n,:) = {hr0_filenames{n}, validity, comment};
end
%% Saves files
