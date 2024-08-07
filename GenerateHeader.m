%Preferable to clear all the memory first before starts the script
clc
clearvars
clear

%% Enter the file name  always change from here
%  main
Input = 'Test';

generateHeader(Input);

%% Local Function starts here

function generateHeader(fileName)
    % generateHeader generates a header for a MATLAB file
    % containing the FileName, MATLAB version, Date Created,
    % and Programmer's Name.
    %
    % Arguments:
    %    fileName (string): The name of the file.

    % Constants
    programmerName = getenv('USERNAME');
    matlabVersion = version;

    % Get the current date
    dateCreated = datestr(now, 'yyyy-mm-dd');

    % Define the header contents
    headerContents = {
        ['FileName: ', fileName]
        ['MATLAB Version: ', matlabVersion]
        ['Date Created: ', dateCreated]
        ['Programmer: ', programmerName]
    };

    % Determine the length of the longest line
    maxLength = max(cellfun(@length, headerContents));

    % Create the header with maximum space before %
    header = '';
    for i = 1:length(headerContents)
        content = headerContents{i};
        padding = repmat(' ', 1, maxLength - length(content) + 11); % 11 is the extra padding for maximum space
        header = sprintf('%s%% %s%s%%\n%% %s %%\n', header, content, padding, repmat(' ', 1, maxLength + 10)); % Add each line and a blank line with %
    end

    % Add the underline
    underline = repmat('_', 1, maxLength + 10); % Adjust the underline length to match the content lines
    header = sprintf('%s%% %s %%\n', header, underline);

    % Print the header
    disp(header);
end





