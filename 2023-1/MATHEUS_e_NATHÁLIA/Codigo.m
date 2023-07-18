clc
clear
close all
%% Dados
x = [410, 440, 470, 510, 550, 583, 620, 670];
y = [0.04332, 0.11134, 0.14157, 0.15285, 0.39392, 0.43069, 0.46029, 0.11813];
%% Escolher posição a ser removida
posicao = 3;
valorx = x(posicao);
valory = y(posicao);
%% Plotar gráfico original
subplot(2, 1, 1);
hold on
scatter(x, y, 'filled', 'black');
scatter(valorx, valory, 'filled', 'r', 'DisplayName', 'Ponto removido');
xlabel('Comprimento de onda do canal (nm)');
ylabel('Dados do sensor');
title('Distribuição Espectral');
grid on;
ylim([0, 0.8]);
legend('Pontos Originais');
hold off
%% Remover ponto escolhido
x(posicao) = [];
y(posicao) = [];
%% Pontos para interpolação
new_x = 410:1:670;
% Interpolação Spline
interp_spline = interp1(x, y, new_x, 'spline');
% Interpolação PCHIP
interp_pchip = interp1(x, y, new_x, 'pchip');
% Interpolação Lagrange
interp_lagrange = lagrange_interpolation(x, y, new_x);
% Interpolação Newton
interp_newton = newton_interpolation(x, y, new_x);
% Interpolação Sinc
interp_sinc = sinc_interp(x, y, new_x);
%% Resultados
pos = (valorx - 409);
Yretirado = valory
Spline = interp_spline(pos)
Sinc = interp_sinc(pos)
Pchip = interp_pchip(pos)
Lagrange = interp_lagrange(pos)
Newton = interp_newton(pos)
%% Plot do gráfico
subplot(2, 1, 2);
hold on;
scatter(new_x, interp_spline, 'filled', 'b', 'DisplayName', 'Spline');
plot(new_x, interp_sinc, 'co', 'LineWidth', 1.5, 'DisplayName', 'Sinc');
scatter(new_x, interp_pchip, 'filled', 'g', 'DisplayName', 'Pchip');
scatter(new_x, interp_lagrange, 'filled', 'm', 'DisplayName', 'Lagrange');
plot(new_x, interp_newton, 'yo', 'LineWidth', 1.5, 'DisplayName', 'Newton');
scatter(valorx, valory, 'filled', 'r', 'DisplayName', 'Ponto removido');
scatter(x, y, 'filled', 'k', 'DisplayName', 'Pontos Originais');
legend('Location', 'best');
xlabel('Comprimento de onda do canal (nm)');
ylabel('Dados do sensor');
title('Distribuição Espectral');
grid on;
box on;
set(gca, 'FontSize', 12);
set(gcf, 'Color', 'white');
ylim([0, 0.8]);
hold off;
%% Funções
% Função para Interpolação Lagrange
function interp_vals = lagrange_interpolation(x, y, new_x)
    interp_vals = zeros(size(new_x));
    for i = 1:numel(new_x)
        interp_vals(i) = lagrange_interpolate(x, y, new_x(i));
    end
end
function interp_val = lagrange_interpolate(x, y, new_x)
    n = numel(x);
    interp_val = 0;
    for i = 1:n
        term = y(i);
        for j = 1:n
            if i ~= j
                term = term * (new_x - x(j)) / (x(i) - x(j));
            end
        end
        interp_val = interp_val + term;
    end
end
% Função para Interpolação de Newton
function interp_vals = newton_interpolation(x, y, new_x)
    n = numel(x);
    interp_vals = zeros(size(new_x));
    for i = 1:numel(new_x)
        interp_vals(i) = newton_interpolate(x, y, new_x(i));
    end
end
function interp_val = newton_interpolate(x, y, new_x)
    n = numel(x);
    interp_val = y(1);
    for i = 2:n
        term = 1;
        for j = 1:i-1
            term = term * (new_x - x(j));
        end
        interp_val = interp_val + term * divided_difference(x(1:i), y(1:i));
    end
end
function coeff = divided_difference(x, y)
    n = numel(x);
    if n == 1
        coeff = y(1);
    else
        coeff = (divided_difference(x(2:n), y(2:n)) - divided_difference(x(1:n-1), y(1:n-1))) / (x(n) - x(1));
    end
end
% Função para Interpolação Sinc
function interp_vals = sinc_interp(x, y, new_x)
    interp_vals = interp1(x, y, new_x, 'sinc');
end
