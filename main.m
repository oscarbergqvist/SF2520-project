%% PLOTS
global a h_t X M
[u, x_vec, t_vec] = gen_u(1, 0, 0);
%%
for k = 1:length(t_vec)
   plot(x_vec, u(:, k))
   axis([0,10000,0,1.1])
   drawnow
end

%% 
figure('name', 'in vs out')
index_shift=floor(X / (a * h_t));
plot(t_vec((index_shift + 1):end), u(end,(index_shift + 1):end))
hold on 
plot(t_vec((index_shift + 1):end), u(1, 1:(end-index_shift)))
hold off
xlabel('t [s]', 'interpreter', 'latex', 'fontsize', 15)
ylabel('U [V]', 'interpreter', 'latex', 'fontsize', 15)
axis([0.0005, 0.003, 0, 1])
%% WITH NOISE

noise_var = [0.001, 0.05, 0.1, 1]; 
figure('Name', 'Noise and output signal')
for i =  1:length(noise_var)
    [u_noisy, ~, ~] = gen_u(1, 1, noise_var(i));
    index_shift=floor(X / (a * h_t));
    subplot(length(noise_var), 1, i)
    plot(t_vec((index_shift + 1):end), u_noisy(end,(index_shift + 1):end))
    hold on 
    plot(t_vec((index_shift + 1):end), (1/2)*u(1, 1:(end-index_shift)))
    hold off
    title("$\eta$ = " + sprintf('%.3f',noise_var(i)), 'interpreter', 'latex', 'fontsize', 30)
    xlabel('t [s]', 'interpreter', 'latex', 'fontsize', 30)
    ylabel('U [V]', 'interpreter', 'latex', 'fontsize', 30)
    axis([0.0005, 0.003, 0, 0.5])
end



%% WITH 

[u, x_vec, t_vec] = gen_u(0.5, 0, 0, 200);

figure('Name', 'Animation of u')
for k = 1:(M+1)
   plot(x_vec, u(:, k))
   axis([0,10000,0,1.1])
   drawnow
end

%% 

figure('name', 'in vs out')

[u, x_vec, t_vec] = gen_u(1, 0, 0, 100);
index_shift=floor(X / (a * h_t));
subplot(4, 1, 1)
plot(t_vec((index_shift + 1):end), u(end,(index_shift + 1):end))
hold on 
plot(t_vec((index_shift + 1):end), u(1, 1:(end-index_shift)))
hold off
title("$\sigma$ = 1, $N = 100$", 'interpreter', 'latex', 'fontsize', 30)
xlabel('t [s]', 'interpreter', 'latex', 'fontsize', 15)
ylabel('U [V]', 'interpreter', 'latex', 'fontsize', 15)
axis([0.0005, 0.003, 0, 1])
[u, x_vec, t_vec] = gen_u(0.5, 0, 0, 100);
index_shift=floor(X / (a * h_t));
subplot(4, 1, 2)
plot(t_vec((index_shift + 1):end), u(end,(index_shift + 1):end))
hold on 
plot(t_vec((index_shift + 1):end), u(1, 1:(end-index_shift)))
hold off
title("$\sigma$ = 0.5, $N = 100$", 'interpreter', 'latex', 'fontsize', 30)
xlabel('t [s]', 'interpreter', 'latex', 'fontsize', 15)
ylabel('U [V]', 'interpreter', 'latex', 'fontsize', 15)
axis([0.0005, 0.003, 0, 1])
[u, x_vec, t_vec] = gen_u(1, 0, 0, 200);
index_shift=floor(X / (a * h_t));
subplot(4, 1, 3)
plot(t_vec((index_shift + 1):end), u(end,(index_shift + 1):end))
hold on 
plot(t_vec((index_shift + 1):end), u(1, 1:(end-index_shift)))
hold off
title("$\sigma$ = 1, $N = 200$", 'interpreter', 'latex', 'fontsize', 30)
xlabel('t [s]', 'interpreter', 'latex', 'fontsize', 15)
ylabel('U [V]', 'interpreter', 'latex', 'fontsize', 15)
axis([0.0005, 0.003, 0, 1])
[u, x_vec, t_vec] = gen_u(0.5, 0, 0, 200);
index_shift=floor(X / (a * h_t));
subplot(4, 1, 4)
plot(t_vec((index_shift + 1):end), u(end,(index_shift + 1):end))
hold on 
plot(t_vec((index_shift + 1):end), u(1, 1:(end-index_shift)))
hold off
title("$\sigma$ = 0.5, $N = 200$", 'interpreter', 'latex', 'fontsize', 30)
xlabel('t [s]', 'interpreter', 'latex', 'fontsize', 15)
ylabel('U [V]', 'interpreter', 'latex', 'fontsize', 15)
axis([0.0005, 0.003, 0, 1])


%% SMOOTH INSIGNAL

[u, x_vec, t_vec] = gen_u(0.1, 0, 0, 100, 'sin');

figure('Name', 'Animation of u')
for k = 1:(M+1)
   plot(x_vec, u(:, k))
   axis([0,10000,0,1.1])
   drawnow
end

%%


figure('name', 'in vs out smooth')

[u, x_vec, t_vec] = gen_u(1, 0, 0, 100, 'sin');
index_shift=floor(X / (a * h_t));
subplot(4, 1, 1)
plot(t_vec((index_shift + 1):end), u(end,(index_shift + 1):end))
hold on 
plot(t_vec((index_shift + 1):end), u(1, 1:(end-index_shift)))
hold off
title("$\sigma$ = 1, $N = 100$", 'interpreter', 'latex', 'fontsize', 30)
xlabel('t [s]', 'interpreter', 'latex', 'fontsize', 15)
ylabel('U [V]', 'interpreter', 'latex', 'fontsize', 15)
axis([0.0005, 0.003, 0, 1])
[u, x_vec, t_vec] = gen_u(0.5, 0, 0, 100, 'sin');
index_shift=floor(X / (a * h_t));
subplot(4, 1, 2)
plot(t_vec((index_shift + 1):end), u(end,(index_shift + 1):end))
hold on 
plot(t_vec((index_shift + 1):end), u(1, 1:(end-index_shift)))
hold off
title("$\sigma$ = 0.5, $N = 100$", 'interpreter', 'latex', 'fontsize', 30)
xlabel('t [s]', 'interpreter', 'latex', 'fontsize', 15)
ylabel('U [V]', 'interpreter', 'latex', 'fontsize', 15)
axis([0.0005, 0.003, 0, 1])
[u, x_vec, t_vec] = gen_u(1, 0, 0, 200, 'sin');
index_shift=floor(X / (a * h_t));
subplot(4, 1, 3)
plot(t_vec((index_shift + 1):end), u(end,(index_shift + 1):end))
hold on 
plot(t_vec((index_shift + 1):end), u(1, 1:(end-index_shift)))
hold off
title("$\sigma$ = 1, $N = 200$", 'interpreter', 'latex', 'fontsize', 30)
xlabel('t [s]', 'interpreter', 'latex', 'fontsize', 15)
ylabel('U [V]', 'interpreter', 'latex', 'fontsize', 15)
axis([0.0005, 0.003, 0, 1])
[u, x_vec, t_vec] = gen_u(0.5, 0, 0, 200, 'sin');
index_shift=floor(X / (a * h_t));
subplot(4, 1, 4)
plot(t_vec((index_shift + 1):end), u(end,(index_shift + 1):end))
hold on 
plot(t_vec((index_shift + 1):end), u(1, 1:(end-index_shift)))
hold off
title("$\sigma$ = 0.5, $N = 200$", 'interpreter', 'latex', 'fontsize', 30)
xlabel('t [s]', 'interpreter', 'latex', 'fontsize', 15)
ylabel('U [V]', 'interpreter', 'latex', 'fontsize', 15)
axis([0.0005, 0.003, 0, 1])