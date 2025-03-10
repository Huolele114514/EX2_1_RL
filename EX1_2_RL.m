clear
clc

%参数
h = 1e-4;
E = 10;
R = 1;
Rs = 1e-3;
L = 1e-2;
t_max = 0.1;
t1 = 0;
cnt = 1;
v = [10;0];
i_L2 = zeros(1,1001);
t = linspace(0,0.1,1001);

%解析法
i_L1 = 10/1*(1-exp(-t*1/0.01));

%拉普拉斯变换法
i_L2 = (E / R) * (1 - exp(-R / L * t));

%数值积分法
i_L3 = zeros(1,1001);
i_L3(1) = 0;
for k=2:1:1001
    i_L3(k) = i_L3(k-1)+h*(10/0.01-1/0.01*i_L3(k-1));
end

%画图
figure;
hold on;
plot(t, i_L1, 'r-', 'DisplayName', '解析法');
plot(t, i_L2, 'g-', 'DisplayName', '拉普拉斯变换法');
plot(t, i_L3, 'b--', 'DisplayName', '数值积分法');
legend;
xlabel('时间 (s)');
ylabel('电流 i_L(A)');
title('RL电路电流响应');
grid on;
