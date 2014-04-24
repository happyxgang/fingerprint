function Y = locmax(X)
%  提取 X 中的所有局部最大值

X = X(:)';
nbr = [X,X(end)] >= [X(1),X];
% 通过差分点乘保留局部最大值，其他位置为0
Y = X .* nbr(1:end-1) .* (1-nbr(2:end));