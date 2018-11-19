function [inliers, transf] = ransac(matches, c1, c2)
% This code is part of:
%
%   CMPSCI 370: Computer Vision, Spring 2018
%   University of Massachusetts, Amherst
%   Instructor: Subhransu Maji
%
%   Homework 4


%size(matches)
inliers = 0;
newinliers = 0;
for i = 1:800
    r1 = randi(size(matches, 1));
    r2 = randi(size(matches, 1));
    while r1 == r2
        r2 = randi(size(matches, 1));
    end
    x1 = c1(3*r1-2);
    x2 = c1(3*r2-2);
    xp1 = c2(matches(r1)*3 - 2);
    xp2 = c2(matches(r2)*3 - 2);
    y1 = c1(3*r1-1);
    y2 = c1(3*r2-1);
    yp1 = c2(matches(r1)*3 - 1);
    yp2 = c2(matches(r2)*3 - 1);
    s = sqrt((xp1 - xp2).^2 + (yp1 - yp2).^2)/sqrt((x1 - x2).^2 + (y1 - y2));
    tx = xp1 - (s * x1);
    ty = yp1 - (s * y1);
    if tx < 1 && ty < 1
    t = 15;
    for j = 1:size(matches, 1)
        xp1 = c2(matches(j)*3 - 2);
        yp1 = c2(matches(j)*3 - 1);
        x1 = c1(3*j-2);
        y1 = c1(3*j-1);
        txp1 = (xp1 - tx) / s;
        typ1 = (yp1 - ty) / s;
        if (x1 - txp1).^2 + (y1 - typ1).^2 < t
            if newinliers ~= 0
                newinliers = [newinliers j];  
            end
            if newinliers == 0
                newinliers = j;
            end
        end
    end
    if size(newinliers, 2) > size(inliers, 2)
        inliers = newinliers;
        transf = [tx ty s];
    end        
    end
end
transf
size(inliers)


