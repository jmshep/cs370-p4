function m = computeMatches(f1,f2)
% This code is part of:
%
%   CMPSCI 370: Computer Vision, Spring 2018
%   University of Massachusetts, Amherst
%   Instructor: Subhransu Maji
%
%   Homework 4
m = zeros(size(f1, 2), 1);
f1cpy = f1;
for i = 1:size(f1, 2)
    f2cpy = f2;
    score = inf;
    place = 0;
    for j = 1:size(f2, 2)
        a = f1cpy(1:size(f1, 1));
        b = f2cpy(1:size(f2, 1));
        test = sum((a-b).^2);
        if test < score
            score = test;
            place = j;
        end
        f2cpy = f2cpy(size(f2, 1)+1:end);
    end
    f1cpy = f1cpy(size(f1, 1)+1:end);
    if place < 300
        m(i) = place;
    end
    if place > 299
        m(i)= 0;
    end
end
