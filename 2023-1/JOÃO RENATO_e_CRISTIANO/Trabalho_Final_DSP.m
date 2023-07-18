clear all
close all
format long eng
clc
Bode_Opt = bodeoptions;
Bode_Opt.FreqUnits = 'Hz';
Bode_Opt.Grid = 'on';

%% Sele��o da topologia do conversor
buck = 1; 
boost = 0; %%ainda n�o implementado
buckboost = 0;
llc = 0; %ainda n�o implementado
flyback = 0;
sepic = 0;

%% Par�metros p/ conversor Buck
if buck == 1

% Parametros do conversor
Vi = 180; % Tens�o de entrada
Vo = 80; % Tens�o m�dia de sa�da
Po = 100; % Pot�ncia M�dia de sa�da
Lo = 1.5E-3; % Indutor de saida
Co = 100E-6; % Capacitor de saida
Rc = 64; % Resistencia de carga
fsw = 20E3; % Frequencia de chaveamento
fs = 20E3; % Frequencia de amostragem
Tsw = 1/fsw; % Periodo de chaveamento
Ts = 1/fs; % Periodo de amostragem

transferfunc = tf(Vi*(1/(Lo*Co)), [1 (1/(Rc*Co)) (1/(Lo*Co))]);

end

%% Par�metros p/ conversor boost %%AINDA NAO ESTA PRONTO
if boost == 1



end

%% Par�metros p/ conversor llc %%AINDA NAO ESTA PRONTO
if llc == 1


end

%% Par�metros p/ conversor Buck-Boost
if buckboost == 1

%%Definicao dos componentes

Vin = 48;
fs = 20e3;
d = 0.5;
dc = (1-d);
L = 500e-6;
Cap = 100e-6;
R = 5;

%%Descricao matamatica por etapa

K = [L 0;0 Cap];
U = Vin;

%Etapa 1
A1 = [0 0;0 -1/R];
B1 = [1;0];
C1 = [1 0;0 1];
E1 = [0;0]; 

%Etapa 2
A2 = [0 1;-1 -1/R];
B2 = [0;0];
C2 = C1;
E2 = E1;

%%Definicao das Matrizes Medias

A = d*A1+dc*A2;
B = d*B1+dc*B2;
C = d*C1+dc*C2;
E = d*E1+dc*E2;

%Calculo dos Valores Medios - Sistema em Equilibrio

X = -inv(A)*B*U;
Y = (-C*inv(A)*B+E)*U;

%%Forma Padrao de Representacao em Espaco de Estados
% Nesta, o vetor de estados � X=[i v]' e a entrada U=[u d]'

Ap = inv(K)*A;
Bp = [inv(K)*B inv(K)*((A1-A2)*X+(B1-B2)*U)];
Cp = C;
Ep = [E ((C1-C2)*X+(E1-E2)*U)];

%%Conversao para funcao transferencia - PSIM

% G=i/d (linha 1) e v/d (linha 2)
[num,den] = ss2tf (Ap,Bp,Cp,Ep,2)
transferfunc = tf(num(2,:),den(1,:))

end


%% Par�metros p/ conversor flyback
if flyback == 1

    %%Definicao dos componentes

Vin = 25;
fs = 40e3;

d = 0.4;
dc = (1-d);

L = 190e-6;
Cap = 22e-6;
R = 5;

N1 = 7;
N2 = 3;

%%Descricao matamatica por etapa

K = [L 0; 0 Cap];
U = Vin;

% Etapa 1
A1 = [0 0; 0 -1/R];
B1 = [1; 0];
C1 = [1 0; 0 1];
E1 = [0; 0]; 

% Etapa 2
A2 = [0 -N1/N2; N1/N2 -1/R];
B2 = [0; 0];
C2 = [1 0; 0 1];
E2 = [0; 0];

%%Definicao das Matrizes Medias

A = d*A1+dc*A2;
B = d*B1+dc*B2;
C = d*C1+dc*C2;
E = d*E1+dc*E2;

%Calculo dos Valores Medios - Sistema em Equilibrio

X = -inv(A)*B*U;
Y = (-C*inv(A)*B+E)*U;

%%Forma Padrao de Representacao em Espaco de Estados
% Nesta, o vetor de estados � X=[i v]' e a entrada U=[u d]'

Ap = inv(K)*A;
Bp = [inv(K)*B inv(K)*((A1-A2)*X+(B1-B2)*U)];
Cp = C;
Ep = [E ((C1-C2)*X+(E1-E2)*U)];

%%Conversao para funcao transferencia - PSIM

% G = i/d (linha 1)
% G = vo/d (linha 2)
[num, den] = ss2tf (Ap,Bp,Cp,Ep,2);
transferfunc = tf(num(2,:),den(1,:));

end

%% Par�metros p/ conversor sepic 
if sepic == 1

    %%Definicao dos componentes

Vin = 24;
fs = 20e3;

d = 0.4;
dc = (1-d);

L1 = 260e-6;
L2 = 420e-6;
Cap1=180e-6;
Cap2=160e-6;
R = 10;

%%Descricao matamatica por etapa

K = [L1 0 0 0; 0 L2 0 0; 0 0 Cap1 0; 0 0 0 Cap2];
U = Vin;

% Etapa 1
A1 = [0 0 0 0; 0 0 -1 0; 0 1 0 0; 0 0 0 -1/R];
B1 = [1; 0; 0; 0];
C1 = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
E1 = [0; 0; 0; 0]; 

% Etapa 2
A2 = [0 0 -1 -1; 0 0 0 1; 1 0 0 0; 1 -1 0 -1/R];
B2 = [1; 0; 0; 0];
C2 = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
E2 = [0; 0; 0; 0]; 

%%Definicao das Matrizes Medias

A = d*A1+dc*A2;
B = d*B1+dc*B2;
C = d*C1+dc*C2;
E = d*E1+dc*E2;

%Calculo dos Valores Medios - Sistema em Equilibrio

X = -inv(A)*B*U;
Y = (-C*inv(A)*B+E)*U;

%%Forma Padrao de Representacao em Espaco de Estados
% Nesta, o vetor de estados � X=[i v]' e a entrada U=[u d]'

Ap = inv(K)*A;
Bp = [inv(K)*B inv(K)*((A1-A2)*X+(B1-B2)*U)];
Cp = C;
Ep = [E ((C1-C2)*X+(E1-E2)*U)];

%%Conversao para funcao transferencia - PSIM

% G = iL1/d (linha 1)
% G = iL2/d (linha 2)
% G = vC1/d (linha 3)
% G = vC2/d (linha 4)
%[num, den] = ss2tf (Ap,Bp,Cp,Ep,2)

% G = iL1/Vin (linha 1)
% G = iL2/Vin (linha 2)
% G = vC1/Vin (linha 3)
% G = vC2/Vin (linha 4)
[num, den] = ss2tf (Ap,Bp,Cp,Ep,1);
transferfunc = tf(num(2,:),den(1,:));


end


%% Par�metros Sensor de Tens�o

%%Par�metros do Sensor de Tens�o

Vo_Max_Sensor = 180; %% Tens�o m�xima de sa�da
V_Sat_Quant = 3; %% Tens�o de satura��o do quantizador do conversor A/D utilizado
R1_Sensor = 1000000; %% R1 do divisor do tens�o

%%C�lculo dos componentes do sensor de tens�o

R2_Sensor = (V_Sat_Quant)*(R1_Sensor/(Vo_Max_Sensor-V_Sat_Quant)); % C�lculo do R2 do divisor de tens�o
Ganho_Sensor = (V_Sat_Quant)/Vo_Max_Sensor; %% Ganho do sensor de tens�o
R1_Sensor
R2_Sensor
Ganho_Sensor %% Print dos resultados

%% Filtro Anti-Aliasing

%%Par�metros do Filtro Anti-Aliasing
nyquist = 10; %% crit�rio de nyquist
fc = fsw/nyquist; %% C�lculo da frequ�ncia de corte do filtro
Hs = tf(2*pi*fc, [ 1 2*pi*fc]); %% Filtro anti-aliasing de primeira ordem
bode(Hs,Bode_Opt);
step(Hs);

%%C�lculo dos componentes do circuito anal�gico do filtro anti-aliasing

R_Hs = 10000
C_Hs = 1/(2*pi*R_Hs*fc)

%% Conversor A/D

%%Par�metros do Conversor A/D

AD_min = 0; %% Valor m�nimo do coneersor A/D
AD_max = 16383; %% Valor m�ximo do conversor A/D
bit_n = 14; %% n�mero de bits do conversor A/D

%%C�lculos do conversor A/D

Res_AD = V_Sat_Quant/(2^(bit_n)-1) %% Resolu��o do conversor A/D
Ganho_AD = 1/Res_AD %% Ganho do conversor A/D

%% PWM

%%Par�metros PWM

f_clock = 120E6;

%%C�lculos PWM

PWM_max_count = f_clock/(2*fsw)
Ganho_PWM = V_Sat_Quant/PWM_max_count

%% Fun��es de Transfer�ncia do Sistema

% Gp(s) - Modelo da planta - Plano s
disp ('Gp(s):');
Gps = transferfunc

% GpH(s) - Planta + Filtro - Plano s
disp ('Gp(s)*H(s):');
GpHs = Gps*Hs

% GpH'(z) - Plano discreto z
disp ('GpH(z):');
GpHz = c2d (GpHs, Ts, 'zoh')

% GpH(w) - Plano cont�nuo w
disp ('GpH(w):');
GpHw = d2c (GpHz, 'tustin')

bode(GpHs,GpHz,GpHw,Bode_Opt)

%sisotool(GpHw); %% exportar C

% Gc(w) - Plano cont�nuo w
%Gcw = C
Gcw = tf([1.903E-6 0.007009 6.157],[0 1 0])

% Discretiza��o do controlador 
disp ('Gc(z):');
Gcz = c2d (Gcw, Ts, 'tustin')

% Gp(z) - Plano discreto z
disp ('Gp(z):');
Gpz = c2d (Gps, Ts, 'zoh')

% H(z) - Plano discreto z
disp ('H(z):');
Hz = c2d (Hs, Ts, 'tustin')


%%
%% AVALIA��O DO DESEMPENHO DO CONTROLADOR PROJETADO

% Bode Planta, controlador e planta controlada no plano w
bode (GpHw, Gcw, GpHw*Gcw, Bode_Opt)
legend ('GpH(w)', 'Gc(w)', 'GpH*Gc(w)');

% Bode de malha aberta da planta discreta com controlador
bode(GpHz*Gcz, Bode_Opt)

%Step na malha aberta
step(GpHz)

% Step na malha fechada
step(feedback (Gpz*Gcz,Hz))

% Compara��o sistema de controle anal�gico vs digital
bode(Gps*Hs*Gcw, Gpz*Hz*Gcz, Bode_Opt)

%Compara��o respota ao degrau malha fechada anal�gico vs digital
step(feedback (Gps*Gcw,Hs),feedback (Gpz*Gcz,Hz))



