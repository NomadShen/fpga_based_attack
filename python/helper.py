import numpy as np

def mean(X):
    return np.sum(X, axis=0)/len(X)

def std_dev(X):
    X_bar = mean(X)
    return np.sqrt(np.sum((X-X_bar)**2, axis=0))

def corr(X, Y):
    X_bar = mean(X)
    Y_bar = mean(Y)
    return np.sum((X-X_bar)*(Y-Y_bar), axis=0)/(std_dev(X)*std_dev(Y))