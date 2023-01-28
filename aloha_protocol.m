clear;clc;lambda=0.36;q_r=0.18;m=30;

if lambda<=0 | lambda >1 
    fprintf ('Syntax: s_aloha(lambda,q_r,m)');
    error ('잘못된 범위: lambda값은 0 ~ 0.36여야 함');
elseif m~=ceil(m)|m==0
    fprintf ('Syntax: s_aloha(lambda,q_r,m)');
    error ('잘못된 값: m은 양의 정수여야 함');
end

q_a=1-exp(-lambda/m); % unbacklogged node send 확률
fprintf('q_a is %f \n',q_a);
if q_r<q_a | q_r>=1 
    fprintf ('Syntax: s_aloha(lambda,q_r,m)'); 
    error ('잘못된 값: q_r은 q_a ~ 1여야 함');
end

fprintf('lambda is %f \n',lambda);
fprintf('q_r is %f \n',q_r);
fprintf('m is %d \n',m);

% number of backlogged stations
for n=0:m,
    G(n+1)=(m-n)*q_a+n*q_r; % attempted transmissions in a slot 기대값
    P_succ_approx(n+1)=G(n+1)*exp(-G(n+1)); % Approximate 성공 확률 
    Arriv_rate(n+1)=(m-n)*q_a;

    Q_a_1_n=(m-n)*((1-q_a)^(m-n-1))*q_a;
    Q_r_0_n=(1-q_r)^n;
    Q_a_0_n=(1-q_a)^(m-n);
    Q_r_1_n=n*(1-q_r)^(n-1)*q_r;

P_succ(n+1)=Q_a_1_n*Q_r_0_n + Q_a_0_n*Q_r_1_n; % 0에서의 성공 확률은 P_succ(1)
end

figure;
plot([0:m],P_succ,'k-');
hold on;
plot([0:m],P_succ_approx,'k+-');
hold on;
plot([0:m],Arriv_rate,'k--');
hold off;

set(gca,'FontSize',10);

xlabel('backlogged nodes 개수');
legend('P_{succ}','추측치 P_{succ}','Arrival rate');
