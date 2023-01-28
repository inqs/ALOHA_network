% Pure
G=0:0.1:7;
S=G.*exp(-2*G);

plot(G,S)

max_G=0;
max_S=0;
temp=0;

for G=0:0.1:7
    S=G.*exp(-2*G);
    if S>max_S
        temp = S;
        max_S = temp;
        max_G=G;
    end
end

max_G
max_S


% Slotted
G=0:0.1:7;
S=G.*exp(-1*G);

plot(G,S)

max_G=0;
max_S=0;
temp=0;

for G=0:0.1:7
    S=G.*exp(-1*G);
    if S>max_S
        temp = S;
        max_S = temp;
        max_G=G;
    end
end

max_G
max_S
