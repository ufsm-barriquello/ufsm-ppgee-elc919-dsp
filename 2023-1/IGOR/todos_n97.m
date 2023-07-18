% 50mT
freq_50mT_n97 = [20e3 50e3 80e3 100e3 200e3];
Pv_50mT_n97 = [4e3 12e3 11e3 27e3 65e3];
f_norm_50mT_n97 = freq_50mT_n97 / max(freq_50mT_n97);
Pv_norm_50mT_50 = Pv_50mT_n97 / max(Pv_50mT_n97);
 
 % 100mT
freq_100mT_n97 = [20e3 30e3 50e3 80e3 100e3 150e3 200e3 300e3];
Pv_100mT_n97 = [11e3 12e3 15e3 100e3 120e3 200e3 300e3 600e3];
f_norm_100mT_n97 = freq_100mT_n97 / max(freq_100mT_n97);
Pv_norm_100mT_50 = Pv_100mT_n97 / max(Pv_100mT_n97);
     
 % 200mT
freq_200mT_n97 = [20e3 40e3 70e3 100e3 150e3 200e3 300e3];
Pv_200mT_n97 = [90e3 200e3 400e3 600e3 900e3 1700e3 3000e3];
f_norm_200mT_n97 = freq_200mT_n97 / max(freq_200mT_n97);
Pv_norm_200mT_50 = Pv_200mT_n97 / max(Pv_200mT_n97);
     
% 300mT
freq_300mT_n97 = [20e3 30e3 40e3 50e3]; 
Pv_300mT_n97 = [230e3 350e3 470e3 600e3];
f_norm_300mT_n97 = freq_300mT_n97 / max(freq_300mT_n97);
Pv_norm_300mT_50 = Pv_300mT_n97 / max(Pv_300mT_n97);


%% Projeto do filtro IIR
ordem = 2; % Ordem do filtro
frequencia_corte = 0.8; % Frequência de corte do filtro (ajuste conforme necessário)
[b, a] = butter(ordem, frequencia_corte, 'low');

%% 50mT 
% Inversão da resposta em frequência
Pv_rebatido_50mT_N97 = 1 - Pv_50mT_n97;
Pv_rebatido_100mT_N97 = 1 - Pv_100mT_n97;
Pv_rebatido_200mT_N97 = 1 - Pv_200mT_n97;
Pv_rebatido_300mT_N97 = 1 - Pv_300mT_n97;

% Aplicação do filtro IIR no sinal rebatido
y1 = filter(b, a, Pv_rebatido_50mT_N97);
y2 = filter(b, a, Pv_rebatido_100mT_N97);
y3 = filter(b, a, Pv_rebatido_200mT_N97);
y4 = filter(b, a, Pv_rebatido_300mT_N97);

% Plot da resposta original e filtrada
figure;
%subplot(2, 1, 1);
%plot(freq_50mT_n97, Pv_50mT_n97, 'b-', 'LineWidth', 2);
hold on;
%plot(freq_50mT_n97, (-1)*y1+6500, 'r-', 'LineWidth', 2);
hold on;

plot(freq_100mT_n97, Pv_100mT_n97, 'b-', 'LineWidth', 2);
hold on;
plot(freq_100mT_n97, (-1)*y2+6500, 'r-', 'LineWidth', 2);

plot(freq_200mT_n97, Pv_200mT_n97, 'b-', 'LineWidth', 2);
hold on;
plot(freq_200mT_n97, (-1)*y3+6500, 'r-', 'LineWidth', 2);

% 250mT
ordem_250 = 3; % Ordem do filtro
fc_250 = 0.8; % Frequência de corte do filtro (ajuste conforme necessário)
[b, a] = butter(ordem_250, fc_250, 'low');
plot(freq_200mT_n97, Pv_200mT_n97, 'b-', 'LineWidth', 2);
hold on;
y4 = filter(b, a, Pv_rebatido_200mT_N97);
plot(freq_200mT_n97, (-1)*y4+250000, 'r-', 'LineWidth', 2);
hold on;

plot(freq_300mT_n97, Pv_300mT_n97, 'b-', 'LineWidth', 2);
hold on;
plot(freq_300mT_n97, (-1)*y4+6500, 'r-', 'LineWidth', 2);

grid on;

title('Volumetric Losses of the N97 Ferrite Core Material');
xlabel('Frequency (Hz)');
ylabel('Volumetric Power Losses (kW/m^(3))');