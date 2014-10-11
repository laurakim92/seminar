% seir_ode.m
%
% Implements a SEIR infection model
%   dS/dt = -beta SI / N
%   dE/dt = beta SI / N - sigma E
%   dI/dt = sigma E - gamma I
%   dR/dt = (1 - f) gamma I
%
% Inputs:
%   t - Time variable
%   x - Variable containing 4 populations (S, E, I, and R)
%   p - Parameters (beta: transmission rate,
%                   sigma: 1/avg incubation period, 
%                   gamma: 1/avg infection period,
%                   f: fatality rate)
% Output:
%   dx - First derivative: the rate of change of the populations

function dx = seir_ode(t,x,p)
    beta = p(1);
    sigma = p(2);
    gamma = p(3);
    f = p(4);
    
    S = x(1);
    E = x(2);
    I = x(3);
    R = x(4);
    N = S + E + I + R;
    
    dS = -beta * S * I / N;
    dE = beta * S * I / N - sigma * E;
    dI = sigma * E - gamma * I;
    dR = (1 - f) * gamma * I;
    
    %dC = sigma * E;
    %dD = f * gamma * I;
    
    dx = [dS; dE; dI; dR];

end

