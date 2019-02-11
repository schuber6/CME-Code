function [J, grad] = costFunctionReg(theta, X, y, lambda)

m = length(y); % number of training examples

predictions = sigmoid(X*theta);
reg_term = (lambda/(2*m)) * sum(theta(2:end).^2);
calcErrors = -y.*log(predictions) - (1 -y).*log(1-predictions);
J = (1/m)*sum(calcErrors)+reg_term;

% prepend a 0 column to our reg_term matrix so we can use simple matrix addition
reg_term = [0 (lambda*theta(2:end)/m)'];
grad = sum(X.*(predictions - y)) / m + reg_term;

end