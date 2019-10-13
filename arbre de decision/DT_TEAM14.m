donnes=load('data_cla.txt');%charger les données
doonees_input=donnes(1:1098,1:4);
doonees_output=donnes(1:1098,5);
Test_input=donnes(1099:1372,1:4);
Test_o=donnes(1099:1372,5);
arbre = fitctree(doonees_input,doonees_output);
view(arbre,'mode','graph');
important=predictorImportance(arbre);
figure;
bar(important);
title('attribut le plus important');
ylabel('Estimation');
xlabel('Prediction');
h = gca;
h.XTickLabel = arbre.PredictorNames;
h.TickLabelInterpreter = 'none'

Correct = 0;
Incorrect = 0;
for i=1:size(Test_input,1)
   result = predict(arbre,Test_input(i,1:4));
   if(result==Test_o(i))      
      Correct = Correct+1;
   else
      Incorrect = Incorrect+1;
   end
end
%Calcul de prédiction
Predection = Correct * 100 / size(Test_input,1);
 
fprintf('Prédiction correcte = '); 
disp(Correct);
fprintf('\nPrédiction incorrecte = '); 
disp(Incorrect);
%Affichage de % de prédiction
disp('Prédiction : %'); 
disp(Predection);
