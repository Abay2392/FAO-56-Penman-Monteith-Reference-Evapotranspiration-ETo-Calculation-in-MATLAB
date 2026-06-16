% Clean the arrays

Hmax_day_val=84
Hmin_day_val=63
Rad_day_val=22.07
TmaxA_day_val= 21.5
TminA_day_val=12.3
Win2m_day_val=2.078

%% Computation area

% Mean Temperature
T_mean=(TmaxA_day_val+TminA_day_val)./2;
% Wind velocity at 2 m above the ground
u_2=Win2m_day_val;
Delta=0.122
% Delta computation
%Delta=(4098.*(0.6108.*exp((17.27.*T_mean)./(T_mean+237.3))))./((T_mean+273.3).^2);
% Atmospheric Pressure P z=10 m for Catania Station
P= 101.3.*(power((((293-(0.0065*100))/293)),5.26));
% Gamma 
gam = 0.000665*P;

% Step 7 Delta Term DT auxiliary calculation for radiation term

DT=Delta/(Delta+(gam.*(1+(0.34*(u_2)))));

% Step 8 Psi term PT auziliary calculation for Wind Term

PT=gam/(Delta+(gam*(1+(0.34*(u_2)))));

% Step 9 Temperature Term TT auxiliary calculation for wind term

TT=(900/(T_mean+273))*u_2;

% G for the formula is euqal to zero for day or by ten data (see Chapter 3 Fao 56)
G=0;
% e_tmax
e_tmax=0.6108*exp((17.27*TmaxA_day_val)/(TmaxA_day_val+237.3));
% e_tmin
e_tmin=0.6108*exp((17.27*TminA_day_val)/(TminA_day_val+237.3));
%e_s
e_s=(e_tmax+e_tmin)/2;
% Max Relative humidity
RH_max=Hmax_day_val;

% Min Relative humidity
RH_min=Hmin_day_val;
%e_a
e_a=((e_tmin*(RH_max/100))+(e_tmax*(RH_min/100)))/2;

% Inverse relative distance Earth-Sun (dr) and solar declination step 12
d_r=1+(0.033.*cos(((2*pi)/(365)).*187));
delta_01=0.409.*sin((((2*pi)/(365)).*187)-1.39);

% Conversion latitude in degrees to radiant
Lat_catania_deg= 50.80;
Lat_rad=deg2rad(Lat_catania_deg);
% Sunset Hour angle
omega_s=acos(-tan(Lat_rad).*tan(delta_01));

%Step 15 Extraterrestrial Radiation (Ra)

R_a=((24*60)/pi)*0.0820.*d_r.*((omega_s.*sin(Lat_rad).*sin(delta_01))+(cos(Lat_rad).*cos(delta_01).*sin(omega_s)));

%Step 16 Clear Sky solar Radiation Rs0
% elevation above sea level 10 m for the San giuseppe La rena Station
z=100;
R_s0=(0.75+2e-5*z).*R_a;

%Step 17 Net solar or net shortwave radiation (Rns)
%0.23 is the abedo or canopy reflection coefficient for the hypothetical
%solar radiation given by SIAS Rad_day_val=Rs
R_s=Rad_day_val;
R_ns=(1-0.23).*R_s; % VERIFY The formula

%Step 18 Net outgoing long wave solar radiation Rnl
% 4.903 Stefan-boltzmann constant
%R_nl=4.9303e-9.*(((TmaxA_day_val+273.16).^4+(TminA_day_val+273.16).^4)./2).*(0.34-(0.14.*sqrt(e_a))).*(((1.35.*(R_s0./R_s0))-0.35));
Tmaxk=TmaxA_day_val+273.16;
QTmaxk4=4.903e-9.*((Tmaxk)^4);
Tmink=TminA_day_val+273.16;
QTmink4=4.903e-9.*((Tmink)^4);
AvQ=(QTmink4+QTmaxk4)/2;
R_nl=AvQ*(0.34-(0.14.*sqrt(e_a))).*(((1.35.*(R_s./R_s0))-0.35))
%Step 19 Net Radiation Rn
R_n=R_ns-R_nl;

R_ng=0.408.*R_n;

%Final Step
%ETO1= 0.408* (R_n)*Delta /(Delta + gam* (1 + (0.34*u_2))) 
ET_rad=DT.*R_ng;
ET_wind=PT.*TT.*(e_s-e_a);

ET_0=ET_wind+ET_rad;
%plot(time_arr,ET_0)

% Main equation reference evapotranspiration

%Et0=(0.408.*(R_n-G)+(gam.*(900./(T_mean+273).*(u_2.*(e_s-e_a)))))./(Delta+gam.*(1+(0.34.*u_2)));




%% Plot Area %%
%figure
%plot(time_arr,ET_0, time_arr, PET_day_val)

% legend('ETo estimated', 'PET SIAS', Orientation='horizontal',Location= 'southoutside');
% R= corrcoef(PET_day_val,ET_0, 'Rows','complete')

% figure
% plot(time_arr,Et0)


