function [Hax_norm,Hay_norm,Za_norm,Delta_T_norm] = Batch_Norm_2(Hax,Hay,Za,Delta_T)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

%% Hax
if min(Hax(:))<0
    Hax_norm = Hax + abs(min(Hax(:)));
    Hax_norm = Hax_norm / max(Hax_norm(:));
else
    Hax_norm = Hax / max(Hax(:));
end

%% Hay
if min(Hay(:))<0
    Hay_norm = Hay + abs(min(Hay(:)));
    Hay_norm = Hay_norm / max(Hay_norm(:));
else
    Hay_norm = Hay / max(Hay(:));
end

%% Za、Za_noise
if min(Za(:))<0
    Za_norm = Za + abs(min(Za(:)));
    Za_norm = Za_norm / max(Za_norm(:));
else
    Za_norm = Za / max(Za(:));
end

%% Delta_T、Delta_T_noise 
if min(Delta_T(:))<0
    Delta_T_norm = Delta_T + abs(min(Delta_T(:)));
    Delta_T_norm = Delta_T_norm / max(Delta_T_norm(:));
else
    Delta_T_norm = Delta_T / max(Delta_T(:));
end

end

