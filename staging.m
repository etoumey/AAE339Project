% Team 7
% AAE 339 Project Staging
function [ dv1, dv2, delta_v2, Mfuel ] = staging( delta_v, delta_v3 )


g0 = 9.81;
Msatellite = 7000;
Isp_sat = 1660;
Isp2 = 465.5;
Isp1 = 362;
%delta_v = 12000;
%delta_v3 = 1000;

fs2 = 9; % mass of fuel : inert mass (Mf/(Mf+Mi)=.9)
fs1 = 9; % mass of fuel : inert mass (Mf/(Mf+Mi)=.9)

Mfuel_sat = (exp(delta_v3/(g0*Isp_sat))-1)*Msatellite;
M03 = 1.05*(Msatellite+Mfuel_sat);

i = 1;

delta_v2 = linspace(0,delta_v-delta_v3,100);

for x = 1:length(delta_v2)
    
    Ms2 = M03*(exp(delta_v2(x)/(g0*Isp2))-1)/(fs2-((exp(delta_v2(x)/(g0*Isp2))-1)));
    Mfuel_2 = Ms2*fs2;
    M02 = 1.05*(M03+Mfuel_2+Ms2);
    delta_v1 = delta_v - delta_v2(x) - delta_v3;
    Ms1 = M02*(exp(delta_v1/(g0*Isp1))-1)/(fs1-((exp(delta_v1/(g0*Isp1))-1)));
    Mfuel_1 = Ms1*fs1;
    Minert(i)=Ms1+Ms2+Msatellite;
    Mfuel(i)= Mfuel_2 + Mfuel_1 + Mfuel_sat;
    dv2(i) = delta_v2(x);
     MfuelOpt(i)= Mfuel_2 + Mfuel_1 + Mfuel_sat;
    i = i + 1;   
   
    
end
dv2=dv2(Minert>0);
Mfuel = Mfuel(Minert>0);
Minert= Minert(Minert>0);

[Mf,I] = min(Mfuel);
Mf;
Mi = Minert(I);

delta_v2Opt = dv2(I);

    Ms2 = M03*(exp(delta_v2Opt/(g0*Isp2))-1)/(fs2-((exp(delta_v2Opt/(g0*Isp2))-1)));
    Mfuel_2 = Ms2*fs2;
    M02 = 1.05*(M03+Mfuel_2+Ms2);
    delta_v1 = delta_v - delta_v2Opt - delta_v3;
    Ms1 = M02*(exp(delta_v1/(g0*Isp1))-1)/(fs1-((exp(delta_v1/(g0*Isp1))-1)));
    Mfuel_1 = Ms1*fs1;

dv2 = g0*Isp2*log((M03+Ms2+Mfuel_2)/(M03+Ms2));
dv1 = g0*Isp1*log((M02+Ms1+Mfuel_1)/(M02+Ms1));

plot(delta_v2, MfuelOpt)
hold on
title('Optimum Delta V')
xlabel('Delta V (m/s)')
ylabel('Fuel Mass (kg)')
plot(delta_v2Opt, Mf, 'ro');
ylim([-1E7, 1E7])
%plot(delta_v-delta_v2, MfuelOpt)

end