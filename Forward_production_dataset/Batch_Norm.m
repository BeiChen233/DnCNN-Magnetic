function [Hax_norm,Hay_norm,Za_norm,Delta_T_norm,Hax_noise_norm,Hay_noise_norm,Za_noise_norm,Delta_T_noise_norm] = Batch_Norm(Hax,Hay,Za,Delta_T,Hax_noise,Hay_noise,Za_noise,Delta_T_noise)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

%% Hax、Hax_noise
if min(min(Hax(:)),min(Hax_noise(:)))<0
    Hax_norm = Hax + abs(min(min(Hax(:)),min(Hax_noise(:))));
    Hax_noise_norm = Hax_noise + abs(min(min(Hax(:)),min(Hax_noise(:))));
    
    Hax_norm = Hax_norm / max(max(Hax_norm(:)),max(Hax_noise_norm(:)));
    Hax_noise_norm = Hax_noise_norm / max(max(Hax_norm(:)),max(Hax_noise_norm(:)));
else
    Hax_norm = Hax / max(max(Hax(:)),max(Hax_noise(:)));
    Hax_noise_norm = Hax_noise / max(max(Hax(:)),max(Hax_noise(:)));
end

%% Hay、Hay_noise
if min(min(Hay(:)),min(Hay_noise(:)))<0
    Hay_norm = Hay + abs(min(min(Hay(:)),min(Hay_noise(:))));
    Hay_noise_norm = Hay_noise + abs(min(min(Hay(:)),min(Hay_noise(:))));
    
    Hay_norm = Hay_norm / max(max(Hay_norm(:)),max(Hay_noise_norm(:)));
    Hay_noise_norm = Hay_noise_norm / max(max(Hay_norm(:)),max(Hay_noise_norm(:)));
else
    Hay_norm = Hay / max(max(Hay(:)),max(Hay_noise(:)));
    Hay_noise_norm = Hay_noise / max(max(Hay(:)),max(Hay_noise(:)));
end

%% Za、Za_noise
if min(min(Za(:)),min(Za_noise(:)))<0
    Za_norm = Za + abs(min(min(Za(:)),min(Za_noise(:))));
    Za_noise_norm = Za_noise + abs(min(min(Za(:)),min(Za_noise(:))));
    
    Za_norm = Za_norm / max(max(Za_norm(:)),max(Za_noise_norm(:)));
    Za_noise_norm = Za_noise_norm / max(max(Za_norm(:)),max(Za_noise_norm(:)));
else
    Za_norm = Za / max(max(Za(:)),max(Za_noise(:)));
    Za_noise_norm = Za_noise / max(max(Za(:)),max(Za_noise(:)));
end

%% Delta_T、Delta_T_noise 
if min(min(Delta_T(:)),min(Delta_T_noise(:)))<0
    Delta_T_norm = Delta_T + abs(min(min(Delta_T(:)),min(Delta_T_noise(:))));
    Delta_T_noise_norm = Delta_T_noise + abs(min(min(Delta_T(:)),min(Delta_T_noise(:))));
    
    Delta_T_norm = Delta_T_norm / max(max(Delta_T_norm(:)),max(Delta_T_noise_norm(:)));
    Delta_T_noise_norm = Delta_T_noise_norm / max(max(Delta_T_norm(:)),max(Delta_T_noise_norm(:)));
else
    Delta_T_norm = Delta_T / max(max(Delta_T(:)),max(Delta_T_noise(:)));
    Delta_T_noise_norm = Delta_T_noise / max(max(Delta_T(:)),max(Delta_T_noise(:)));
end

end


















