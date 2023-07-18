clear all
close all
clc

% Vetores de frequência e resposta original
freq_50mT_25 = [56240 63190 70850 79500 89160 99900 112140 125890 141250 158730 177930 199170 224180 251230 282480 316450 354610 396820 446420];
Pv_50mT_25 = [12961.9805 15604.4297 16830.1797 19549.1504 21775.6699 24738.2 28571.1602 32667.5195 38661.7695 44974.9414 53250.5703 62939.1797 76507.1797 91968.9062 111679.477 135915.984 169085.391 211298.875 265564];

% Normalização dos vetores
Pv_50mT_25_norm = Pv_50mT_25 / max(Pv_50mT_25);
freq_50mT_25_norm = freq_50mT_25 / max(freq_50mT_25);

A = 300e3; % Potência inicial maior que a maior potência do vetor "Pv_50mT_25"
Gp = (A-Pv_50mT_25)/A; % Função resultante da conversão

% Projetar filtro IIR passa-baixas usando a função butter
ordem = 2; % Ordem do filtro
fc = 0.423; % Frequência de corte normalizada

[b, a] = butter(ordem, fc, 'low');

% Converter filtro para o domínio Z usando a função bilinear
fs1 = 35; % Frequência de amostragem
fs2 = 45;
[bz1, az1] = bilinear(b, a, fs1);
[bz2, az2] = impinvar(b, a, fs2);

% Frequência de amostragem para o filtro no domínio Z
freq_samples = 19; % Número de amostras de frequência
w = linspace(0, pi, freq_samples);
w_hz1 = w / pi * fs1 / 2;
w_hz2 = w / pi * fs2 / 2;

% Calcular resposta em frequência do filtro no domínio Z
[H1, ~] = freqz(bz1, az1, w);
[H2, ~] = freqz(bz2, az2, w);

% Plotar resposta original e resposta do filtro no domínio Z
figure;

% Plot das duas respostas sobrepostas em outra figura
figure;
plot(freq_50mT_25_norm, -Gp, 'b');
hold on;
plot(w_hz1, -abs(H1), 'r');
plot(w_hz2, -abs(H2), 'g');
xlabel('Frequência Normalizada / Frequência (Hz)');
ylabel('Amplitude Normalizada / Magnitude');
title('Resposta Original, Filtro IIR Bilinear, Filtro IIR Impinvar');
legend('Resposta Original', 'Bilinear','Impinvar');
xlim([0, 1]);

grid on;