function [u, x_vec, t_vec] = gen_u(sigma, noise, noise_var, varargin)
    global h_t    
    global a
    global X
    global M
    
    N = 100; 
    in_signal = "sqaure";
    if length(varargin) == 2
        in_signal = varargin{2};
    end
        
    if ~isempty(varargin)
        N = varargin{1};
    end
    
    R = 0.004;
    L = 1e-6;
    C = 0.25e-8;
    X = 10000;
    t_max = 0.003;
    h_x = X / N;
    a = 1/sqrt(L*C);
    h_t = h_x * sigma/a;
    M =t_max/h_t;
    x_vec= 0:h_x:X;
    t_vec = 0:h_t:t_max;
    
    u = zeros(N+1, M+1);
    for k = 1:M+1
        if noise == 1
            if in_signal == "sin"
                u(1, k) = sin((k-1)*h_t);
            else 
                u(1, k) = sqrt(noise_var) * randn([1, 1]) + uzero((k-1)*h_t);
            end         
        else
            if in_signal == "sin"
                u(1, k) = 0.5+0.5*sin((k-1)*h_t*100/t_max);
            else 
                u(1, k) = uzero((k-1)*h_t);
            end    
        end
    end

    for i = 2:N
       u(i, 2) =1/(2*L)* h_t^2/h_x^2 * (1/C*u(i+1,1)...
           +(2*L*h_x^2/h_t^2-2/C)*u(i,1)+(1/C)*u(i-1,1)); 
    end

    u(N+1, 2) = sigma * u(N, 1) + (1 - sigma) * u(N+1, 1);
    for k = 2:M
        for i = 2:N
            u(i, k+1) = 2/(R*h_t+2*L)*h_t^2/h_x^2 * (...
                (1/C)*u(i+1, k) ...
                    +  (1/C)* u(i-1, k) ...
                    + (2*L*h_x^2/h_t^2-2/C) * u(i, k) ...
                    + ((R*h_t-2*L)/2*h_x^2/h_t^2)*u(i, k-1));
        end
        u(N+1, k+1) = sigma * u(N, k) + (1 - sigma) * u(N+1, k);
    end

end