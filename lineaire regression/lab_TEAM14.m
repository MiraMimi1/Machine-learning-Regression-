%lecture des donnees d'entrainement
tmp=load('Data.txt');
y = tmp(1:185,7);%60% du dataset
X=tmp(1:185,1:6);%60% du dataset
%%crossvalidation
ycv=tmp(186:246,7);
xcv=tmp(186:246,1:6);
%test
ytest=tmp(247:308,7);
xtest=tmp(247:308,1:6);

m = length(y); %nombre d'exemples d'entrainement
C=Normalisationdesattributs_TEAM14(X);
d=size(X,2);
num_iterations=5000;%iterations pour le GradirentDescent
alpha = 0.4;%pas d'apprentissage
lambda=0;
%%l=7;
%sig=Covariance(C,y);
%[U,S,V]=svd(sig);
%v=mink(l,y,S);
%Ureduce = U(:,1:l);
%z=Ureduce'*C; 

C= [ones(m,1),C];%ajout de 1 a la colonne de X
xtest= [ones(62,1),xtest];
%theta = (inv(C'*C))*(C'*y);
theta = rand(d+1,1);
J = Cost_TEAM14( C , y , theta,lambda);
[theta,J_history]=GradientDescent_TEAM14(C,y,theta,alpha,num_iterations,lambda);
%plot de la fonction du cout
plot(1: num_iterations, J_history, '-r');
xlabel('nombre d itérations');
ylabel('J(Theta)');
title('le cout');

sum=0;
test = [];
error = 0;
%test
for i= 1 : length(ytest)
    test= xtest(i,:)*theta;
    if((test - ytest(i,:)) > 1)
        error = error +1;
    end
    erreur = (test - ytest(i,:));
    sum = sum+erreur;
end
taux = (length(ytest) - sum)*62/100;
fprintf('taux de reussite %f \n',taux); %taux de réussite 

%test

D=Normalisationdesattributs_TEAM14(xcv);
De=[ones(61,1),xcv];
pr=De(3,:)*theta;
re=(ycv(3)-pr+9);
fprintf('difference entre output et Y estimé %f\n',re);


