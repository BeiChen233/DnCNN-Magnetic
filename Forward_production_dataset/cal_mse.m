function [mse] = cal_mse(im1,im2)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
difference = ((im1-im2)).^2;
%difference = abs(im1-im2);
mse = sum(difference(:))/(size(im1,1)*size(im1,2)*size(im1,3));

end

