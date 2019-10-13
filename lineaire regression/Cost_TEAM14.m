function J= Cost_TEAM14(X,y,theta,lambda)
    m=length(y);
    %calcul du cout
    J=(1/(2*m))*sum((hypothese_TEAM14(X, theta) - y).^2)+(lambda / (2 * m)) * sum(theta(2:end) .^ 2);
end
    
    