function IMAGEOUT = calculate_mean_image(IMDIR, IMBASE, IMEXT, NDIGITS, STARTIMAGE, ENDIMAGE);

% Number format
nFormat = ['%0' num2str(NDIGITS) '.0f'];

% Image list
imageNum = STARTIMAGE : ENDIMAGE;

% Number of images
nImages = length(imageNum);

% Determine the file name of the first image
fileName = [IMBASE num2str(imageNum(1), nFormat) IMEXT];

% Determine the file path of the first image
filePath = fullfile(IMDIR, fileName);

% Determine the size of the first image
imgSize = size(imread(filePath));

% Initialize sum image
IMAGEOUT = zeros(imgSize);

% Calculate the mean
for k = 1 : nImages
    
    % Construct the file name
    fileName = [IMBASE num2str(imageNum(k), nFormat) IMEXT];
    
    % Construct the file path
    filePath = fullfile(IMDIR, fileName);
    
    % Check existence of the file path.
    if exist(filePath, 'file')
    
        % Read the image if it exists
        img = imread(filePath);
        
        % Add its contribution to the sum-image
        IMAGEOUT = IMAGEOUT + double(img);
    end
    
end

% Divide by the number of images to take the mean.
IMAGEOUT = IMAGEOUT ./ nImages;


end


