R = 0.004;
L = 1e-6;
C = 0.25e-8;
N = 100;
M = 100;
X = 10000;
t_max = 0.003;
x_h = L / N;
t_h = t_max / M; 

u = zeros(N+1, M+1);
for k = 1:M+1
    u(1, k) = uzero((k-1)*t_h); 
end



