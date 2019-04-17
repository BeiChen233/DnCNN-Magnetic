%% 生成磁法正演数据集
clc;clear all;close all;

Grid_size = 80;
Grid_interval = 1;
x = -Grid_size:Grid_interval:Grid_size;
y = -Grid_size:Grid_interval:Grid_size;
v = get(0,'ScreenSize');% 获取计算机屏幕的位置和分辨率

%%
model_num = round(rand()*(3-1) +1);
Hax = zeros([size(x,2),size(y,2)]);
Hay = zeros([size(x,2),size(y,2)]);
Za = zeros([size(x,2),size(y,2)]);
Delta_T = zeros([size(x,2),size(y,2)]);
for i = 1:model_num
    [Haxi,Hayi,Zai,Delta_Ti] = Forward_Sphere_Single(Grid_size,Grid_interval);
    Hax = Hax + Haxi;
    Hay = Hay + Hayi;
    Za = Za + Zai;
    Delta_T = Delta_T + Delta_Ti;
    %subplot(2,2,i);
    %contourf(x,y,Delta_Ti,30);colorbar;% 绘制等值线图
end
Image_pixel = size(Za,1)*3;
%subplot(2,2,4);


%% Batch Normalization
%{
subplot(2,2,1);
contourf(x,y,Za,30);colorbar;% 绘制等值线图
subplot(2,2,2);
Za_norm = Za / max(Za(:));
contourf(x,y,Za_norm,30);colorbar;% 绘制等值线图
if min(Za(:))<0
    Za_norm2 = Za + abs(min(Za(:)));
    Za_norm3 = Za_norm2/max(Za_norm2(:));
end
subplot(2,2,3);
contourf(x,y,Za_norm2,30);colorbar;% 绘制等值线图
subplot(2,2,4);
contourf(x,y,Za_norm3,30);colorbar;% 绘制等值线图
%}

%% 看看两个球体模型的结果
%{
[Hax1,Hay1,Za1,Delta_T1] = Mag_Forward_Sphere(Grid_size,Grid_interval);
[Hax2,Hay2,Za2,Delta_T2] = Mag_Forward_Sphere(Grid_size,Grid_interval);
Delta_T = Delta_T1 + Delta_T2;
subplot(2,2,1);contourf(x,y,Delta_T1,30);colorbar;% 绘制等值线图
subplot(2,2,2);contourf(x,y,Delta_T2,30);colorbar;% 绘制等值线图
subplot(2,2,3);contourf(x,y,Delta_T,30);colorbar;% 绘制等值线图
%}