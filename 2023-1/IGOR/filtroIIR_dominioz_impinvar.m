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

% Converter filtro para o domínio Z usando a função impinvar
fs = 45; % Frequência de amostragem
[bz, az] = impinvar(b, a, fs);

% Frequência de amostragem para o filtro no domínio Z
freq_samples = 19; % Número de amostras de frequência
w = linspace(0, pi, freq_samples);
w_hz = w / pi * fs / 2;

% Calcular resposta em frequência do filtro no domínio Z
[H, ~] = freqz(bz, az, w);

% Plotar resposta original e resposta do filtro no domínio Z
figure;

% Subplot com a resposta original
subplot(2, 1, 1);
plot(freq_50mT_25_norm, -Gp, 'b');
xlabel('Frequência Normalizada');
ylabel('Amplitude Normalizada');
title('Resposta Original');

% Subplot com a resposta do filtro no domínio Z
subplot(2, 1, 2);
plot(w_hz, -abs(H), 'r');
xlabel('Frequência (Hz)');
ylabel('Magnitude');
title('Resposta do Filtro IIR no Domínio Z');
xlim([0, 1]);

% Plot das duas respostas sobrepostas em outra figura
figure;
plot(freq_50mT_25_norm, -Gp, 'b');
hold on;
plot(w_hz, -abs(H), 'r');
xlabel('Frequência Normalizada / Frequência (Hz)');
ylabel('Amplitude Normalizada / Magnitude');
title('Resposta Original e Resposta do Filtro IIR no Domínio Z');
legend('Resposta Original', 'Resposta Filtro IIR');
xlim([0, 1]);

grid on;