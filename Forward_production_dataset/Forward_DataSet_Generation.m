% ���ɴŷ��������ݼ�
clc;clear all;close all;

tic;
%% �����ʷֲ���
Grid_size = 80;% �����С
Grid_interval = 1;% ������
x = -Grid_size:Grid_interval:Grid_size;% x�����ʷ�
y = -Grid_size:Grid_interval:Grid_size;% y�����ʷ�


% ѭ����������
DataSet_num = 5;% ���ݽ��������������1�� = Hax��Hay��Za��DelTa_T �ĸ�������
array_clean = zeros(size(x,2),size(x,2),DataSet_num*4);% �洢���ݵ���ά����
array_noisy = zeros(size(x,2),size(x,2),DataSet_num*4);% ����ά��ʾ����ĸ���

for i=1:DataSet_num
    %% Forward
    [Hax,Hay,Za,Delta_T] = Forward_Sphere_Multiple(Grid_size,Grid_interval);
    noise_percentage = 0.03;% �����ٷֱ�
    [Hax_noise,Hay_noise,Za_noise,Delta_T_noise] = AddNoise(Hax,Hay,Za,Delta_T,noise_percentage);
    % mse1 = cal_mse(Hax,Hax_noise)
    
    %% Batch Normalization
    [Hax,Hay,Za,Delta_T,Hax_noise,Hay_noise,Za_noise,Delta_T_noise] = Batch_Norm_3(Hax,Hay,Za,Delta_T,Hax_noise,Hay_noise,Za_noise,Delta_T_noise);
    
    %% ����Ϊͼ�����ݼ�
    % contourf_num = round(rand()*(2)+8);% ��ֵ��ͼ�ĵ�ֵ������
    contourf_num = 12;
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
mse2 = cal_mse(array_clean,array_noisy)
toc;










