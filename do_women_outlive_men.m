% Do women outlive men? 

% In this M file, box-plot is drawn for the ages of deceased men and women
% Pie charts are drawn to analyze the factors that might affect the death
% of both genders.

%importing the data set 

csv = xlsread('heart_failure_clinical_records_dataset.xlsx');

% defining the variables
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

%outliers 
age_out = find(isoutlier(age'));

% identifying the missing age values 

age_missing = sum(ismissing(age));

% validity check 

invalid_age = find(age < 0);

%the ages of all the males and the females who died
dead_male_age = age(sex==0 & death_event==1)

dead_female_age =age(sex==1 & death_event==1);

% the below plots compare the ages that men and women die at

subplot(1,2,1)
%box-plot for deceased men and their ages
boxplot(dead_male_age, 'Labels', {'Male'})
xlabel("Deceased")
title("Ages of Deceased Male")
ylabel("Age")

subplot(1,2,2)
%box-plot for deceased women and their ages
boxplot(dead_female_age,'Labels', {'Female'})
title("Ages of Deceased Female")
xlabel("Deceased")
ylabel("Age")


%histogram for frequency of deaths within particular age brackets(male and female)
histogram(dead_male_age)
hold on;
histogram(dead_female_age)
title('Frequency of deaths by sex and age')
xlabel('Age')
ylabel('Deaths')
legend('Male Deaths', 'Female Deaths')



%percentage of male vs female living past 65
past_65_men = sum(sex==0 &age > 65 &death_event==0)
past_65_female = sum(sex==1 & age>65 &death_event==0)

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
x = [past_65_men past_65_female]
pie(x)
legend("Male","Female")
title("Percentage of Male VS. Female living past 65")
