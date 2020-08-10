function [mn, q1, med, q3, mx, mu, sig] = summary(vec)
% summary - calculates summary statistics
% vec - a vector of numerical values
% mn - minimum value
% q1 - median value of the lower-half
% med - median value
% q3 - median value of the upper-half
% mx - maximum value
% mu - mean value
% sig - standard deviation value
mn = min(vec);
q1 = quantile(vec, .25);
med = median(vec);
q3 = quantile(vec, .75);
mx = max(vec);
mu = mean(vec);
sig = std(vec);
end
