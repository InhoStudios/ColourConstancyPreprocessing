folder = 'images';
images = dir(fullfile(folder, '\*.jpg'));


for i = 1:numel(images)
    filename = fullfile(folder, images(i).name);
    evaluateCC(filename);
end
    
function evaluateCC(filename)
    input_im = double(imread(filename));
    
    [wR,wG,wB,out1]=shades_of_grey(input_im,1);
    greyWorld = uint8(out1);
    imwrite(greyWorld,strcat("export-greyworld-", filename));
    
    p=6;
    [wR,wG,wB,out2]=shades_of_grey(input_im,p);
    shadesOfGrey = uint8(out2);
    imwrite(shadesOfGrey,strcat("export-shadesofgrey-", filename));
        
end