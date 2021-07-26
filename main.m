folder = 'images\**';
export_folder = 'exports\';
images = dir(fullfile(folder, '\*.jpg'));

length = numel(images);

for i = 1:length
    imgname = images(i).name;
    foldername = images(i).folder;
    filename = fullfile(foldername, imgname);
    
    if ~isfile(fullfile(export_folder, 'greyworld', imgname)) && ~isfile(fullfile(export_folder, 'shadesofgrey', imgname))
        fprintf('Processing %d of %d: %s...\n', i, length, filename);
        evaluateCC(filename, imgname);
    end
end
    
function evaluateCC(filename, imgname)
    export_folder = 'exports\';

    input_im = double(imread(filename));
    
    [wR,wG,wB,out1]=shades_of_grey(input_im,1);
    greyWorld = uint8(out1);
    imwrite(greyWorld, fullfile(export_folder, 'greyworld', imgname));
    
    p=6;
    [wR,wG,wB,out2]=shades_of_grey(input_im,p);
    shadesOfGrey = uint8(out2);
    imwrite(shadesOfGrey, fullfile(export_folder, 'shadesofgrey', imgname));
        
end