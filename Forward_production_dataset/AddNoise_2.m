function [Hax_noise,Hay_noise,Za_noise,Delta_T_noise] = AddNoise_2(Hax,Hay,Za,Delta_T)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��



noise_sigma = 0.01;
% Za = Za + normrnd(0,noise_sigma,size(Za));
% Za = Za + randn(size(Za)) * noise_sigma;
Za_noise = Za + randn(size(Za)) * noise_sigma;
Hax_noise = Hax + randn(size(Hax)) * noise_sigma;
Hay_noise = Hay + randn(size(Hay)) * noise_sigma;
Delta_T_noise = Delta_T + randn(size(Delta_T)) * noise_sigma;


% �ٷֱȼ�����
% Za_noise = Za + randn(size(Za)).*(Za * noise_percentage);
% Hax_noise = Hax + randn(size(Hax)).*(Hax * noise_percentage);
% Hay_noise = Hay + randn(size(Hay)).*(Hay * noise_percentage);
% Delta_T_noise = Delta_T + randn(size(Delta_T)).*(Delta_T * noise_percentage);

end