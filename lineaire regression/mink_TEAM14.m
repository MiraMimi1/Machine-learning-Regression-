function k=mink_TEAM14(l,y,S)
m=length(y);
S1=0;
S2=0;
for i= 1:l
    S1=S1+S(i,i);
end
for i= 1:m
    S2=S2+S(i,i);
end
k=1-(S1/S2);
disp(k)
disp(l);
