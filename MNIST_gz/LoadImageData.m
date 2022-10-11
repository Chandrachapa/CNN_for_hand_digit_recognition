% Loads a compressed IDX3 file with image data
function X = LoadImageData(filename)

    dataFolder = fullfile(tempdir,'mnist');
    gunzip(filename,dataFolder);
    
    [~,name,~] = fileparts(filename);
    [fileID,errmsg] = fopen(fullfile(dataFolder,name),'r','b');
    
    magicNum = fread(fileID,1,'int32',0,'b');
    if magicNum == 2051
        fprintf('\nRead MNIST image data...\n')
    end
    
    numImages = fread(fileID,1,'int32',0,'b');
    fprintf('Number of images in the dataset: %6d ...\n',numImages);
    numRows = fread(fileID,1,'int32',0,'b');
    numCols = fread(fileID,1,'int32',0,'b');
    
    X = fread(fileID,inf,'unsigned char');
    
    X = reshape(X,numCols,numRows,numImages);
    X = permute(X,[2 1 3]);
    X = X./255;
    
    fclose(fileID);

end