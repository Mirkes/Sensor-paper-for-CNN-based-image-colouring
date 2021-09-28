% tif2png
% Transform tif images to png
files = dir('*.tif');
map = colormap('gray');
for fil = 1:size(files, 1)
    % extract content of zip file
    fN = files(fil).name;
    im=imread(fN);
    im1 = double(im);
    mi = min(im1(:));
    ma = max(im1(:));
    im1 = (im1 - mi) / (ma - mi);
    im2 = repmat(im1,1,1,3);
    imwrite(im2, map, [fN, '.png']);
end