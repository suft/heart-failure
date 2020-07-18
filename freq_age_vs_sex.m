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

% outliers
age_outs = find(isoutlier(age', 'quartile'));

% split data into 2 series
male = age(sex == 0);
female = age(sex == 1);

% plot freq-histogram
subplot(2, 1, 1);
histogram(male);
hold on
histogram(female);
hold off
title('Heart Attack Age-Freq vs. Sex');
xlabel('Age Groups');
ylabel('Frequency');
legend('Male','Female');

% plot box-plot
subplot(2, 1, 2);
group = [ones(size(male)); 2 * ones(size(female))];
boxplot([male; female], group, 'Labels', {'Male', 'Female'});
title('Ages of Heart Attack Patients')
xlabel('Sex')
ylabel('Age')
