% 生成磁法正演数据集
clc;clear all;close all;

tic;
%% 网格剖分参数
Grid_size = 80;% 网格大小
Grid_interval = 1;% 网格间距
x = -Grid_size:Grid_interval:Grid_size;% x方向剖分
y = -Grid_size:Grid_interval:Grid_size;% y方向剖分


% 循环生成样本
DataSet_num = 5;% 正演结果的样本组数（1组 = Hax、Hay、Za、DelTa_T 四个样本）
array_clean = zeros(size(x,2),size(x,2),DataSet_num*4);% 存储数据的三维矩阵
array_noisy = zeros(size(x,2),size(x,2),DataSet_num*4);% 第三维表示矩阵的个数

for i=1:DataSet_num
    %% Forward
    [Hax,Hay,Za,Delta_T] = Forward_Sphere_Multiple(Grid_size,Grid_interval);
    noise_percentage = 0.03;% 噪声百分比
    [Hax_noise,Hay_noise,Za_noise,Delta_T_noise] = AddNoise(Hax,Hay,Za,Delta_T,noise_percentage);
    % mse1 = cal_mse(Hax,Hax_noise)
    
    %% Batch Normalization
    [Hax,Hay,Za,Delta_T,Hax_noise,Hay_noise,Za_noise,Delta_T_noise] = Batch_Norm_3(Hax,Hay,Za,Delta_T,Hax_noise,Hay_noise,Za_noise,Delta_T_noise);
    
    %% 保存为图像数据集
    % contourf_num = round(rand()*(2)+8);% 等值线图的等值线条数
    contourf_num = 12;
    path = ["./Train_clean/test_","./Train_noisy/test_"];% 保存图像数据目录
    % image_type = ["color","gray"];
    Image_pixel = size(Za,1)*3;% 图像像素值大小
    Save_Image(Hax,Hay,Za,Delta_T,Grid_size,Grid_interval,Image_pixel,i,path(1),contourf_num);% 保存清晰图像
    Save_Image(Hax_noise,Hay_noise,Za_noise,Delta_T_noise,Grid_size,Grid_interval,Image_pixel,i,path(2),contourf_num);% 保存加噪图像
     
    %% 保存为三维矩阵
    array_clean = Save_mat(array_clean,Hax,Hay,Za,Delta_T,i);
    array_noisy = Save_mat(array_noisy,Hax_noise,Hay_noise,Za_noise,Delta_T_noise,i);
    
    
end
% reshape
array_clean = permute(array_clean,[3,1,2]);
array_noisy = permute(array_noisy,[3,1,2]);
%% save as *.mat file
save('./data/array_clean.mat','array_clean');
save('./data/array_noisy.mat','array_noisy');
%% Calculation MSE
mse2 = cal_mse(array_clean,array_noisy)
toc;










