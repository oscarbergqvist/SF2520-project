%% PLOTS
global a h_t X M
%%
[u, x_vec, t_vec] = gen_u(1, 0, 0);

figure('Name', 'Animation of u')
for k = 1:length(t_vec)
   plot(x_vec, u(:, k))
   axis([0,10000,0,1.1])
   drawnow
end

%% WITH NOISE

noise_var = [0.001, 0.01, 0.02, 0.04, 0.06, 0.08, 0.1, 1]; 
figure('Name', 'Noise and output signal')
for i =  1:length(noise_var)
    [u_noisy, ~, ~] = gen_u(1, 1, noise_var(i));
    index_shift=floor(X / (a * h_t));
    subplot(length(noise_var), 1, i)
    plot(t_vec((index_shift + 1):end), u_noisy(end,(index_shift + 1):end))
    hold on 
    plot(t_vec((index_shift + 1):end), (1/2)*u(1, 1:(end-index_shift)))
    hold off
    title(sprintf('%.3f',noise_var(i)))
    axis([0.0005, 0.003, 0, 0.5])
end

%% WITH 

[u, x_vec, t_vec] = gen_u(0.8, 0, 0, 100);

figure('Name', 'Animation of u')
for k = 1:(M+1)
   plot(x_vec, u(:, k))
   axis([0,10000,0,1.1])
   drawnow
end

%% SMOOTH INSIGNAL

[u, x_vec, t_vec] = gen_u(0.1, 0, 0, 100, 'sin');

figure('Name', 'Animation of u')
for k = 1:(M+1)
   plot(x_vec, u(:, k))
   axis([0,10000,0,1.1])
   drawnow
end
