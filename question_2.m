% importing the data set 
csv = readmatrix('heart_failure_clinical_records_dataset.csv');

% defining the variables 
age = csv(:, 1);
sex = csv(:, 10);

% missing value check
nan_age = sum(ismissing(age));
nan_sex = sum(ismissing(sex));

% validity check
invalid_age = length(find(age < 0));
invalid_sex = length(find(sex < 0 | sex > 1));

% defining the constants
MALE = 0;
FEMALE = 1;

% splitting data
male_ages = age(sex == MALE);
female_ages = age(sex == FEMALE);

% outliers
male_age_outs = find(isoutlier(male_ages', 'quartile'));
female_age_outs = find(isoutlier(female_ages', 'quartile'));

% summary stats
disp('Male Stats');
min(male_ages)
max(male_ages)
mean(male_ages)
median(male_ages)

disp('Female Stats');
min(female_ages)
max(female_ages)
mean(female_ages)
median(female_ages)

% plot box-plot
subplot(2, 1, 1);
group = [ones(size(male_ages)); 2 * ones(size(female_ages))];
boxplot([male_ages; female_ages], group, 'Labels', {'Male', 'Female'});
title('Ages of Heart Attack Patients')
xlabel('Sex')
ylabel('Age')

% plot freq-histogram
subplot(2, 1, 2);
histogram(male_ages);
hold on
histogram(female_ages);
hold off
title('Heart Attack Age-Freq vs. Sex');
xlabel('Age Groups');
ylabel('Frequency');
legend('Male','Female');
