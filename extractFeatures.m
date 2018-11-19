function f = extractFeatures(im, c, patchRadius)
% This code is part of:
%
%   CMPSCI 370: Computer Vision, Spring 2018
%   University of Massachusetts, Amherst
%   Instructor: Subhransu Maji
%
%   Homework 4
grayim = rgb2gray(im);
grayim = padarray(grayim, [patchRadius patchRadius],0,'both');
firstloop = true;
while size(c, 2) ~= 0
    patch  = grayim((c(2)) : (c(2) + patchRadius + patchRadius), (c(1)) : (c(1) + patchRadius + patchRadius));
    vector = patch(:);
    if ~firstloop
        f = cat(2, f, vector);
    end
    if firstloop
        f = vector;
        firstloop = false;
    end
    c = c(4:end);
end
