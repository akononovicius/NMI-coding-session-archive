function simProb = simulate(mu,sigma,nSamples)
    X = normrnd(mu,sigma,1,nSamples);
    simProb = sum((-1 <= X) & (X <= 1)) / nSamples;
end