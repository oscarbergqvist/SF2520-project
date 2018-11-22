R = 0.004;
L = 1e-6;
C = 0.25e-8;
N = 100;
X = 10000;
t_max = 0.003;
h_x = X / N;
% h_t = t_max / M; 
a = 1/sqrt(L*C);
%sigma_adv = a * h_t / h_x;=
sigma_adv=1; 
h_t= h_x*sigma_adv/a;
M =t_max/h_t;

u = zeros(N+1, M+1);
for k = 1:M+1
    u(1, k) = uzero((k-1)*h_t); 
end

for i = 2:N
   u(i, 2) = h_t^2 * (1/(2*L*C*h_x^2) * u(i+1, 1) ...
       + (1/h_t^2 - 1/h_t^2) * u(i, 1) + 1/(2*L*C*h_x^2) * u(i-1, 1)); 
end

u(N+1, 2) = sigma_adv * u(N, 1) + (1 - sigma_adv) * u(N+1, 1);
for k = 2:M
    for i = 2:N
        u(i, k+1) = (R/(2*L*h_t) + 1/(2*h_t^2))^(-1) ...
            * ((1/(2*L*C*h_x^2)) * u(i+1, k) ...
                + (1/h_t^2 - 1/(L*C*h_x^2)) * u(i, k) ...
                + (R/(2*L*h_t) -1/(2*h_t^2)) * u(i, k-1) ...
                + 1/(2*L*C*h_x^2) * u(i-1, k));
    end
    u(N+1, k+1) = sigma_adv * u(N, k) + (1 - sigma_adv) * u(N+1, k);
end

%% PLOTS

x_vec= 0:h_x:X;
figure('Name', 'Animation of u')
for k = 1:(M+1)
   plot(x_vec, u(:, k))
   axis([0,10000,0,1.1])
   drawnow
end
