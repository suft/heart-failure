% Do women outlive men? 

% In this M file, a  box-plot is drawn for the ages of deceased men and women
% Pie charts are drawn to analyze the possible clinical factors that might
% have contributed to the death in both genders 

%importing the data set 

csv = readmatrix('heart_failure_clinical_records_dataset.csv');

% reading the variables
age = csv(:, 1);

%identifying the NaN values
idx = isnan(age)

%removing the NaN values
age(idx)=[]

ejectionFraction = csv(:,5)
bp = csv(:,6)
death_event = csv(:, 13);
sex = csv(:, 10);
diabetes = csv(:,4);
smoking = csv(:,11);

%identifying the outliers 
age_out = find(isoutlier(age'));

% identifying if there are any values missing 
% using the built-in function
age_missing = sum(ismissing(age));

% validity check, there can't be a negative age 
invalid_age = find(age < 0);

%filtering the deceased by gender and finding the age

% male
dead_male_age = age(sex==0 & death_event==1)

%female
dead_female_age =age(sex==1 & death_event==1);

% using the user defined function summary, we create a table for the
% statistical analysis

% calculating the statistical summary for deceased males(with outliers)
[mn, q1, med, q3, mx, mu, sig] = summary(dead_male_age)
 
 Summary_Statistics = {'Size'; 'Min'; 'Lower Quartile'; 'Max'; 'Upper Quartile';'Mean'; 'Median'; 'Variance'; 'Standard Deviation'}   
 Male = {length(dead_male_age); mn; q1; mx; q3; mu; med; sig.^2; sig}
 % calculating the statistical summary for deceased females(with outliers)   
 [mn, q1, med, q3, mx, mu, sig] = summary(dead_female_age)
 Female = {length(dead_female_age); mn; q1; mx; q3; mu; med; sig.^2; sig}
 % constructing the summary table
 table(Summary_Statistics, Male, Female)



% the following segment of code filters the data from the outliers
%
%
%

%removing outliers from age column for both genders
dead_female_age_noOut = round(rmoutliers(dead_female_age))
dead_male_age_noOut = round(rmoutliers(dead_male_age))

% summary table without the outliers
 % calculating the statistical summary for deceased males(with outliers)   
[mn, q1, med, q3, mx, mu, sig] = summary(dead_male_age_noOut)
Summary_Statistics = {'Size'; 'Min'; 'Lower Quartile'; 'Max'; 'Upper Quartile';'Mean'; 'Median'; 'Variance'; 'Standard Deviation'} 
Male = {length(dead_male_age_noOut); mn; q1; mx; q3; mu; med; sig.^2; sig}
 % calculating the statistical summary for deceased females(with outliers)   
[mn, q1, med, q3, mx, mu, sig] = summary(dead_female_age)
Female = {length(dead_female_age_noOut); mn; q1; mx; q3; mu; med; sig.^2; sig}
table(Summary_Statistics, Male, Female)



subplot(1,2,1)
%box-plot for deceased men and their ages
boxplot(dead_male_age_noOut, 'Labels', {'Male'})
xlabel("Deceased")
title("Ages of Deceased Male")
ylabel("Age")

subplot(1,2,2)
%box-plot for deceased women and their ages
boxplot(dead_female_age_noOut,'Labels', {'Female'})
title("Ages of Deceased Female")
xlabel("Deceased")
ylabel("Age")

% In the following code segment, filteration of clinical factors is done by
% gender to determine what could have contributed to the death in both
% gender


%amount of men living past 65
past_65_men = age(sex==0 & death_event==0)
total_men = sum(past_65_men > 65)

% amount of women living past 65
past_65_female = age(sex==1 & death_event==0)
total_women = sum(past_65_female > 65)

%finding deceased men and women who happend to have high blood pressure
bp_men = sum(sex==0 & death_event==1 & bp==1)
bp_women = sum(sex==1 & death_event==1& bp==1)

%diabetes of men vs women(deceased)
diabetes_men = sum(sex==0 & death_event==1&diabetes==1)
diabetes_women = sum(sex==1 & death_event==1&diabetes==1)

%smoking of men vs women (deceased)
smoking_men = sum(sex==0 & death_event==1 & smoking==1)
smoking_women =  sum(sex==1 & death_event==1 & smoking==1)


% the below pie charts display the ratio of male to female in factors 
% that might have affected their deaths 
% These include: Smoking, Diabetes, High Blood Pressure, men vs women
% living past 65 years of age

% percentage of women smoking vs percentage of men smoking(deceased)
subplot(2,2,1)
x = [smoking_men smoking_women]
pie(x)
legend("Male","Female")
title("Percenteage of Deceased who were smokers")

%percentage of men smoking vs percentage of women smoking(deceased)
subplot(2,2,2)
x = [diabetes_men diabetes_women]
pie(x)
legend("Male","Female")
title("Percentage of Deceased with Diabetes")

%percentage of men with high blood pressure vs percentage of women with
%high blood pressure(deceased)
subplot(2,2,3)
x = [bp_men bp_women]
pie(x)
legend("Male","Female")
title("Percentage of Deceased with High Blood Pressure")

%percentage of men living past 65 vs percentage of women living past 65
subplot(2,2,4)
x = [total_men total_women]
pie(x)
legend("Male","Female")
title("Percentage of Male VS. Female living past 65")
