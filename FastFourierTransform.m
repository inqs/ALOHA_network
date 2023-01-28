% 주어진 고정값
A = 1;
f = 1; % 1Hz

k=1;
sum=0; %시그마값 저장용

% t = linspace(0,2,1000); %시간 0<t<2
Ts = 1/100; %0.01초로 샘플링
t = 0:Ts:10-Ts; 

for k=1:2:99
    func = sin(2*pi*k*f*t)/k;
    sum = sum + func;
end

s = A * (4/pi) * sum;   % 함수
%plot(t,s);

X=fft(s);
plot(abs(X));

