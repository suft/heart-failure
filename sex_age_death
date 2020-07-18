% do women tend to outlive men

%importing the data set 

csv = xlsread('heart_failure_clinical_records_dataset.xlsx');

% defining the needed variables
age = csv(:, 1);
death_event = csv(:, 13);
sex = csv(:, 10);

%outliers 
age_out = find(isoutlier(age'));

% identifying the missing age values 

age_missing = sum(ismissing(age));

% validity check 

invalid_age = find(age < 0);

%the age of all the males and the females who died

dead_male_age = age(sex==0 & death_event==1);
dead_female_age =age(sex==1 & death_event==1);

%plotting histograms represent the frequency of dead males and dead females of all age groups

histogram(dead_male_age)
hold on;
histogram(dead_female_age)
title('Frequency of deaths by sex and age')
xlabel('Age')
ylabel('Deaths')
legend('Male Deaths', 'Female Deaths')








