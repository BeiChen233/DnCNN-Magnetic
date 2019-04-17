function [Hax,Hay,Za,Delta_T] = Forward_Sphere_Multiple(Grid_size,Grid_interval)
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��


x = -Grid_size:Grid_interval:Grid_size;
y = -Grid_size:Grid_interval:Grid_size;

% model_num = round(rand()*(2-1) +1);
model_num = 2;
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
    % max(Delta_Ti(:))
    % min(Delta_Ti(:))
    %max(max(Delta_Ti(:)),abs(min(Delta_Ti(:))))
    %subplot(2,2,i);
    %contourf(x,y,Delta_Ti,20);colorbar;% ���Ƶ�ֵ��ͼ

end
% subplot(2,2,4);
% contourf(x,y,Delta_T,30);colorbar;% ���Ƶ�ֵ��ͼ

end

