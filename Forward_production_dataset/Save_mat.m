function  [array_clean] = Save_mat(array_clean,Hax,Hay,Za,Delta_T,i)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明

string_array = ["Hax","Hay","Za","Delta_T"];

for j=1:size(string_array,2)
% for j=1:1
    k = size(string_array,2)*(i-1)+j;
    if j==1
        array_clean(:,:,k) = Hax;
    end
    if j == 2
        array_clean(:,:,k) = Hay;
    end
    if j == 3
        array_clean(:,:,k) = Za;
    end
    if j == 4
        array_clean(:,:,k) = Delta_T;
    end
end
end

