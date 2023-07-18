clear all
close all
clc

%% Declaração de Dados

%% 50mT

%25°C
freq_50mT_25 =[56240 63190 70850 79500 89160 99900 112140 125890 141250 158730 177930 199170 224180 251230 282480 316450 354610 396820 446420]
Pv_50mT_25 = [12961.9805 15604.4297 16830.1797 19549.1504 21775.6699 24738.2 28571.1602 32667.5195 38661.7695 44974.9414 53250.5703 62939.1797 76507.1797 91968.9062 111679.477 135915.984 169085.391 211298.875 265564];
f_norm_50mT_25 = freq_50mT_25 / max(freq_50mT_25);
Pv_norm_50mT_25 = Pv_50mT_25 / max(Pv_50mT_25);

%50°C
freq_50mT_50 = [56240 63180 70860 79500 89160 99900 112140 125890 141250 158730 177930 199160 224180 251230 282470 316450 354610 396820 446420];
Pv_50mT_50 = [8000.34 9720.24 10546.3701 12386.7695 14019.2197 15946.1 18903.2793 22124.6309 26990.3691 32040.0098 39063.5195 47316.8711 59145.1211 73419.1328 92091.4922 116392.062 149223.375 193058.875 249983.203];
f_norm_50mT_50 = freq_50mT_50 / max(freq_50mT_50);
Pv_norm_50mT_50 = Pv_50mT_50 / max(Pv_50mT_50);


%% 100mT

%25°C
freq_100mT_25 = [56240 63190 70850 79490 89160 99910 112140 125890 141250 158730 177930 199170 224180 251230 282470 316450 354600 396820];
Pv_100mT_25 = [69580.9531 79203.2 90271.1797 102713.242 118576.008 133625.281 157600.188 179447.469 210024.344 246916.797 290935.188 344088.312 414641.781 500484.5 593202.75 716305.438 876998.312 1090658.25];
f_norm_100mT_25 = freq_100mT_25 / max(freq_100mT_25);
Pv_norm_100mT_25 = Pv_100mT_25 / max(Pv_100mT_25);

%50°C
freq_100mT_50 = [56240 63190 70850 79490 89160 99910 112140 125890 141250 158730 177930 199170 224180 251230 282470 316450 354600 396820];
Pv_100mT_50 = [46270.7617 53212.0898 61596.5781 70606.6875 82424.75 93855.6 113079.703 131089.094 156683.016 187450.297 224904.891 271146.625 332914.656 410432.75 497767.5 614463.75 771741.688 981394.312];
f_norm_100mT_50 = freq_100mT_50 / max(freq_100mT_50);
Pv_norm_100mT_50 = Pv_100mT_50 / max(Pv_100mT_50);


%% 150mT

%25°C
freq_150mT_25 = [56240 63190 70850 79500 89160 99900 112140 125890 141250 158730 177930 199170 224180 251230];
Pv_150mT_25 = [203877.984 233051.844 266281.406 302003.281 348630.469 400471.875 470179.188 540618.75 632087 742155.812 859830.438 1017005.81 1221364.25 1471763.38];
f_norm_150mT_25 = freq_150mT_25 / max(freq_150mT_25);
Pv_norm_150mT_25 = Pv_150mT_25 / max(Pv_150mT_25);

%50°C
freq_150mT_50 = [56240 63180 70860 79500 89160 99900 112140 125890 141250 158730 177930 199160 224180 251230];
Pv_150mT_50 = [146583.547 167996.875 194712.375 222790.984 260048.75 301727.125 360366.781 419640.594 498170.344 594056.438 696136.5 836781 1019147.25 1248092.88];
f_norm_150mT_50 = freq_150mT_50 / max(freq_150mT_50);
Pv_norm_150mT_50 = Pv_150mT_50 / max(Pv_150mT_50);


%% 200mT

%25°C
freq_200mT_25 = [56240 63190 70850 79500 89160 99910 112140 125890 141250 158730 177930 199170];
Pv_200mT_25 = [345878.938 395131.344 449674.219 518657.125 599623.375 683833.375 802855.375 927695.062 1071741.62 1257193.88 1478312.5 1753108.5];
f_norm_200mT_25 = freq_200mT_25 / max(freq_200mT_25);
Pv_norm_200mT_25 = Pv_200mT_25 / max(Pv_200mT_25);

%50°C
freq_200mT_50 = [56240 63180 70860 79500 89160 99900 112140 125890 141250 158730 177930 199100];
Pv_200mT_50 = [261250.516 297294.688 345533.406 400924.375 467704.438 538197.312 641623.875 749640.562 873957.688 1041204.5 1235279.62 1485049.62];
f_norm_200mT_50 = freq_200mT_50 / max(freq_200mT_50);
Pv_norm_200mT_50 = Pv_200mT_50 / max(Pv_200mT_50);


%% 250mT

%25°C
freq_250mT_25 = [56240 63180 70850 79500 89170 99900 112140 125890 141250 158730];
Pv_250mT_25 = [572013.25 661204.375 751797.062 861220.312 995656.562 1142673 1325138 1531711.5 1798721.62 2123832.25];
f_norm_250mT_25 = freq_250mT_25 / max(freq_250mT_25);
Pv_norm_250mT_25 = Pv_250mT_25 / max(Pv_250mT_25);

%50°C
freq_250mT_50 = [56240 63180 70860 79500 89160 99900 112140 125890 141250 158730];
Pv_250mT_50 = [452297.062 523987.594 606320 698803.688 814303.375 941706.188 1103591.62 1288716.88 1526658.88 1821607.62];
f_norm_250mT_50 = freq_250mT_50 / max(freq_250mT_50);
Pv_norm_250mT_50 = Pv_250mT_50 / max(Pv_250mT_50);


%% 275mT

%25°C
freq_275mT_25 = [56240 63180 70850 79500 89160 99910 112140 125890 141250];
Pv_275mT_25 = [741135.812 859186.25 970938.688 1123011.12 1290328.75 1472468.25 1718660.12 2003653 2347360.25];
f_norm_275mT_25 = freq_275mT_25 / max(freq_275mT_25);
Pv_norm_275mT_25 = Pv_275mT_25 / max(Pv_275mT_25);

%50°C
freq_275mT_50 = [56240 63180 70860 79500 89160 99900 112140 125890 141250];
Pv_275mT_50 = [600210.875 697181.875 798465.375 931559.25 1078281.38 1239184.12 1463338.88 1722458.25 2033524.88];
f_norm_275mT_50 = freq_275mT_50 / max(freq_275mT_50);
Pv_norm_275mT_50 = Pv_275mT_50 / max(Pv_275mT_50);


%% Plotagem das Curvas de Diferentes Induções Magnéticas (Bmax), em 25°C, para Diversas Frequências de Excitação do Núcleo

% 50mT
%scatter(freq1,Pv_50mT); %plot(Freq,Pv_50mT);
%hold on;

% Formatação do Gráfico com todas as Bmax
    % Adicionar rótulos aos eixos x e y
    xlabel('Frequency (Hz)');
    ylabel('Volumetric Losses (kW/m^3)');

    % Adicionar título ao gráfico
    title('N87 Ferrite Material Volumetric Core Losses');

    % Legendas
    legend('50mT');
    
%% Projeto Filtro IIR 50mT - 50°C

ordem_50mT = 1; % Escolha a ordem do filtro (ajuste conforme necessário)
fc_50mT = 0.99; % Escolha a frequência de corte do filtro (ajuste conforme necessário)
[b, a] = butter(ordem_50mT, fc_50mT, 'low');

% Resposta do filtro IIR projetado
freq_filt_50mT = linspace(0, 1, 1000); % Vetor de frequência para a resposta do filtro
H = freqz(b, a, freq_filt_50mT, fc_50mT); % Calcula a resposta em frequência do filtro
figure;
%plot(freq_filt_50mT,H)

% Aplicação do filtro IIR às Funções Originais, de 50mT a 275mT, em 25°C e
% 50°C
Pv_filtered_50mT_25 = filter(b, a, Pv_50mT_25);
Pv_filtered_50mT_50 = filter(b, a, Pv_50mT_50);

Pv_filtered_100mT_25 = filter(b, a, Pv_100mT_25);
Pv_filtered_100mT_50 = filter(b, a, Pv_100mT_50);

Pv_filtered_150mT_25 = filter(b, a, Pv_150mT_25);
Pv_filtered_150mT_50 = filter(b, a, Pv_150mT_50);

Pv_filtered_200mT_25 = filter(b, a, Pv_200mT_25);
Pv_filtered_200mT_50 = filter(b, a, Pv_200mT_50);

Pv_filtered_250mT_25 = filter(b, a, Pv_250mT_25);
Pv_filtered_250mT_50 = filter(b, a, Pv_250mT_50);

Pv_filtered_275mT_25 = filter(b, a, Pv_275mT_25);
Pv_filtered_275mT_50 = filter(b, a, Pv_275mT_50);

%% Plot da resposta original e filtrada
figure;

%% Respostas Originais
scatter(freq_50mT_25,Pv_50mT_25);
hold on;

scatter(freq_50mT_50,Pv_50mT_50);
hold on;

scatter(freq_100mT_25,Pv_100mT_25);
hold on;

scatter(freq_100mT_50,Pv_100mT_50);
hold on;

scatter(freq_150mT_25,Pv_150mT_25);
hold on;

scatter(freq_150mT_50,Pv_150mT_50);
hold on;

scatter(freq_200mT_25,Pv_200mT_25);
hold on;

scatter(freq_200mT_50,Pv_200mT_50);
hold on;

scatter(freq_250mT_25,Pv_250mT_25);
hold on;

scatter(freq_250mT_50,Pv_250mT_50);
hold on;

scatter(freq_275mT_25,Pv_275mT_25);
hold on;

scatter(freq_275mT_50,Pv_275mT_50);
hold on;


%% Respostas Filtradas
plot(freq_50mT_25,Pv_filtered_50mT_25);
hold on;

plot(freq_50mT_50,Pv_filtered_50mT_50);
hold on;

plot(freq_100mT_25,Pv_filtered_100mT_25);
hold on;

plot(freq_100mT_50,Pv_filtered_100mT_50);
hold on;

plot(freq_150mT_25,Pv_filtered_150mT_25);
hold on;

plot(freq_150mT_50,Pv_filtered_150mT_50);
hold on;

plot(freq_200mT_25,Pv_filtered_200mT_25);
hold on;

plot(freq_200mT_50,Pv_filtered_200mT_50);
hold on;

plot(freq_250mT_25,Pv_filtered_250mT_25);
hold on;

plot(freq_250mT_50,Pv_filtered_250mT_50);
hold on;

plot(freq_275mT_25,Pv_filtered_275mT_25);
hold on;

plot(freq_275mT_50,Pv_filtered_275mT_50);
hold on;

title('Volumetric Losses of the N87 Ferrite Material');
xlabel('Frequency (Hz)');
ylabel('Volumetric Losses (kW/m^3)');

legend('50mT - 25°C','50mT - 50°C','100mT - 25°C','100mT - 50°C','150mT - 25°C','150mT - 50°C','200mT - 25°C','200mT - 50°C','250mT - 25°C','250mT - 50°C','275mT - 25°C','275mT - 50°C');

%100mT - Original 50°C','100mT - Filtrada 50°C','150mT - Original 25°C','150mT - Filtrada 25°C','150mT - Original 50°C','150mT - Filtrada 50°C','200mT - Original 25°C','200mT - Filtrada 25°C','200mT - Original 50°C','200mT - Filtrada 50°C','250mT - Original 25°C','250mT - Filtrada 25°C','250mT - Original 50°C','250mT - Filtrada 50°C','275mT - Original 25°C','275mT - Filtrada 25°C','275mT - Original 50°C','275mT - Filtrada 50°C'

grid on;