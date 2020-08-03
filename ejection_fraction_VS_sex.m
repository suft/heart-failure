% How did the ejection fraction differ for the deceased men and women 
% with and without outliers

csv = xlsread('heart_failure_clinical_records_dataset.xlsx')
% defining the variables

ejectionFraction = csv(:,5)
sex = csv(:,10)
%removing the NaN values from ejection fraction
idx = isnan(ejectionFraction)

ejectionFraction(idx)=[]

death_event = csv(:,13)

high_bp = csv(:,6)

% validity check 
invalid_ejection = find(ejectionFraction < 0)

% ejection fraction of men and women(with outliers)
ejectMenwOut = ejectionFraction(sex==0)
ejectWomenwOut = ejectionFraction(sex==1)

%The below box-plots compare the ejection fraction between men and women 
%(outliers included)

subplot(1,2,1)
boxplot(ejectMenwOut,'Labels', {'Male'})
ylabel("Ejection Fraction (%)")
title("Ejection Fraction of Men - With Outliers")

subplot(1,2,2)
boxplot(ejectWomenwOut,'Labels', {'Female'})
ylabel("Ejection Fraction (%)")
title("Ejection Fraction of Women - With Outliers")

%finding summary statistics for ejection fraction(filtered by gender - with outliers)
%please see summary.m for the description of the outputs
[mn, q1, med, q3, mx, mu, sig] = summary(ejectMenwOut)
[mn, q1, med, q3, mx, mu, sig] = summary(ejectWomenwOut)

%identifying missing values in both the death_event column and ejection
%fraction
ejection_missing = sum(ismissing(ejectionFraction))
death_event_missing = sum(ismissing(death_event))

%ejection fraction of men and women(without outliers)
noOutlier_ejectionMale = round(rmoutliers(ejectMenwOut))
noOutlier_ejectionFemale = round(rmoutliers(ejectWomenwOut))

%sub-plots showing the ejection fraction of men and women(without outliers)
subplot(1,2,1)
boxplot(noOutlier_ejectionMale,'Labels', {'Male'})
ylabel("Ejection Fraction (%)")
title("Ejection Fraction of Men - No Outliers")
subplot(1,2,2)
boxplot(noOutlier_ejectionFemale,'Labels', {'Female'})
ylabel("Ejection Fraction (%)")
title("Ejection Fraction of Women - No Outliers")


%finding summary statistics for ejection fraction(filtered by gender - no outliters)
% please refer to the summary.m file for the description of the output
% variables
[mn, q1, med, q3, mx, mu, sig] = summary(noOutlier_ejectionMale)
[mn, q1, med, q3, mx, mu, sig] = summary(noOutlier_ejectionFemale)
