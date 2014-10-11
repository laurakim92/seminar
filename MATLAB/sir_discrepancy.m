% sir_discrepancy.m
%
% Finds the sum of squares of residuals
% Measures the discrepancy between the data and estimation from SIR model
%
% Inputs:
%   p - Parameters (transmission rate: beta, infection rate: gamma)
%   data - Actual data points
%   tspan - Time span for which the ODEs are solved
%   x0 - Initial conditions
% Output:
%   disc - Sum of squares of the discrepancy

function disc = sir_discrepancy(p, data, tspan, x0)

[t,x] = ode45(@sir_ode,tspan,x0,[],p);
I = x(:,2);
I = I(1:27);
disc = sum((I-data').^2);

end

