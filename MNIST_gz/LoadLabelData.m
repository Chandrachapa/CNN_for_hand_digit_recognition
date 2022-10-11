% Loads a compressed IDX1 file with label data
function labels = LoadLabelData(filename)

dataFolder = fullfile(tempdir,'mnist3');
gunzip(filename,dataFolder);

[~,name,~] = fileparts(filename);
[fid,errmsg] = fopen(fullfile(dataFolder,name),'r','b');

% Read digit labels
header = fread(fid, 1, 'int32');
if header ~= 2049
    error('Invalid label file header');
end

count = fread(fid, 1, 'int32');

labels = fread(fid, count, 'uint8');
fclose(fid);

end