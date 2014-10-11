% sir_optimize.m
%
% Find the optimized parameters using fminsearch function.
% Starts at p0 and attempts to find a local minimizer p_opt
% which would give the smallest discrepancy.
%
% Inputs:
%   data - Actual data points
%   tspan - Time span for which the ODEs are solved
%   x0 - Initial conditions
%   p0 - Parameters (transmission rate: beta, infection rate: gamma)
% Output:
%   p_opt - Optimal values for beta and gamma

function p_opt = sir_optimize(data, tspan, x0, p0)

p_opt = fminsearch(@sir_disc_nested, p0);
    function disc = sir_disc_nested(p)
        disc = sir_discrepancy(p, data, tspan, x0);
    end

end

