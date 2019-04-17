% ���ɴŷ��������ݼ�
clc;clear all;close all;

tic;
%% �����ʷֲ���
Grid_size = 80;% �����С
Grid_interval = 1;% ������
x = -Grid_size:Grid_interval:Grid_size;% x�����ʷ�
y = -Grid_size:Grid_interval:Grid_size;% y�����ʷ�


% ѭ����������
DataSet_num = 10;% ���ݽ����������
array_clean = zeros(size(x,2),size(x,2),DataSet_num);% �洢���ݵ���ά����
array_noisy = zeros(size(x,2),size(x,2),DataSet_num);% ����ά��ʾ����ĸ���

for i=1:DataSet_num/4
    %% Forward
    [Hax,Hay,Za,Delta_T] = Forward_Sphere_Multiple(Grid_size,Grid_interval);

    %% Batch Normalization
    [Hax,Hay,Za,Delta_T] = Batch_Norm_2(Hax,Hay,Za,Delta_T);
    
    %% Add Noise
    [Hax_noise,Hay_noise,Za_noise,Delta_T_noise] = AddNoise_2(Hax,Hay,Za,Delta_T);


    
    %% ����Ϊͼ�����ݼ�
    % contourf_num = round(rand()*(2)+8);% ��ֵ��ͼ�ĵ�ֵ������
    contourf_num = 20;
    path = ["./Train_clean/test_","./Train_noisy/test_"];% ����ͼ������Ŀ¼
    % image_type = ["color","gray"];
    Image_pixel = size(Za,1)*3;% ͼ������ֵ��С
    Save_Image(Hax,Hay,Za,Delta_T,Grid_size,Grid_interval,Image_pixel,i,path(1),contourf_num);% ��������ͼ��
    Save_Image(Hax_noise,Hay_noise,Za_noise,Delta_T_noise,Grid_size,Grid_interval,Image_pixel,i,path(2),contourf_num);% �������ͼ��
     
    %% ����Ϊ��ά����
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
mse = cal_mse(array_clean,array_noisy)
toc;