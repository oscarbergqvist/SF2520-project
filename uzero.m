function usignal=uzero(t)
    tau=rem(t,0.0004);
    T0=1e-14; 
    T1=0.00005; 
    T2= 0.00010; 
    T3= 0.00013; 
    T4= 0.00018; 
    T5= 0.00025;
    u0=1;
    m=length(t);
    u1=zeros(m,1);
    ind=find(T0<=tau & tau<=T1 | T2<=tau & tau <=T3 | T4<=tau & tau<=T5);
    u1(ind)=u0*ones(size(ind));
    usignal=u1;
end