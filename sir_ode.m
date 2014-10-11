% sir_ode.m
%
% Implements a SIR infection model
%   dS/dt = -beta SI/N
%   dI/dt = beta SI/N - gamma I
%   dR/dt = gamma I
%
% Inputs:
%   t - Time variable
%   x - Variable containing 3 populations (S, I, and R)
%   p - Parameters (transmission rate: beta, infection rate: gamma)
% Output:
%   dx - First derivative: the rate of change of the populations

function dx = sir_ode(t,x,p)
    beta = p(1);
    gamma = p(2);
    
    S = x(1);
    I = x(2);
    R = x(3);
    N = S + I + R;
    
    dS = -beta * S * I / N;
    dI = beta * S * I / N - gamma * I;
    dR = gamma * I;
    
    dx = [dS; dI; dR];

end

