function [Hax_norm,Hay_norm,Za_norm,Delta_T_norm,Hax_noise_norm,Hay_noise_norm,Za_noise_norm,Delta_T_noise_norm] = Batch_Norm_3(Hax,Hay,Za,Delta_T,Hax_noise,Hay_noise,Za_noise,Delta_T_noise)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

%% Hax
Hax_abs_max = max(max(abs(Hax(:))),max(max(Hax_noise(:))));
Hax_norm = Hax / Hax_abs_max;
Hax_noise_norm = Hax_noise / Hax_abs_max;
%% Hay
Hay_abs_max = max(max(abs(Hay(:))),max(abs((Hay_noise(:)))));
Hay_norm = Hay / Hay_abs_max;
Hay_noise_norm = Hay_noise / Hay_abs_max;

%% Za、Za_noise
Za_abs_max = max(max(abs(Za(:))),max(abs(Za_noise(:))));
Za_norm = Za / Za_abs_max;
Za_noise_norm = Za_noise / Za_abs_max;

%% Delta_T、Delta_T_noise
Delta_T_abs_max = max(max(abs(Delta_T(:))),max(abs(Delta_T_noise(:))));
Delta_T_norm = Delta_T / Delta_T_abs_max;
Delta_T_noise_norm = Delta_T_noise / Delta_T_abs_max;

end