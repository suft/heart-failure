% do women tend to outlive men 

%importing the data set 

csv = xlsread('heart_failure_clinical_records_dataset.xlsx');

% defining the variables
age = csv(:, 1);
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

%the ages of all the males and the females who died, 
%shown using a box-plot
dead_male_age = age(sex==0 & death_event==1)

dead_female_age =age(sex==1 & death_event==1);

subplot(1,2,1)
boxplot(dead_male_age, 'Labels', {'Male'})
xlabel("Deceased")
title("Ages of Deceased Male")
ylabel("Age")

subplot(1,2,2)

boxplot(dead_female_age,'Labels', {'Female'})
title("Ages of Deceased Female")
xlabel("Deceased")
ylabel("Age")

% the average age of men who died and female who died
men = mean(age(sex==0 & death_event==1))
women = mean(age(sex==1 & death_event==1))


%how many men and women live past 65
past_65_men = sum(sex==0 &age > 65 &death_event==0)
past_65_female = sum(sex==1 & age>65 &death_event==0)


%ejection fraction - men VS. women
eject_men = mean(ejectionFraction(sex==0 & death_event==1))
eject_women = mean(ejectionFraction(sex==1 & death_event==1))

%more men have high blood pressure than women
bp_men = sum(sex==0 & death_event==1 & bp==1)
bp_women = sum(sex==1 & death_event==1& bp==1)

%diabetes of men vs women
diabetes_men = sum(sex==0 & death_event==1&diabetes==1)
diabetes_women = sum(sex==1 & death_event==1&diabetes==1)

%smoking of men vs women
smoking_men = sum(sex==0 & death_event==1 & smoking==1)
smoking_women =  sum(sex==1 & death_event==1 & smoking==1)


% BELOW is a MAYBE - not fully sure yet - doesn't really show much
%male_age = age(sex==0);

%histogram(dead_male_age)
%hold on;
%histogram(dead_female_age)
%title('Frequency of deaths by sex and age')
%xlabel('Age')
%ylabel('Deaths')
%legend('Male Deaths', 'Female Deaths')




% the factors that affect the death
% pie-charts

subplot(1,4,1)
x = [smoking_men smoking_women]
pie(x)
legend("Men","Women")
title("Percenteage of Deceased who were smokers")

subplot(1,4,2)
x = [diabetes_men diabetes_women]
pie(x)
legend("Men","Women")
title("Percentage of Deceased with Diabetes")

subplot(1,4,3)
x = [bp_men bp_women]
pie(x)
legend("Men","Women")
title("Percentage of Deceased with High Blood Pressure")

subplot(1,4,4)
x = [past_65_men past_65_female]
pie(x)
legend("Men","Women")
title("Percentage of Women VS. Men living past 65")










