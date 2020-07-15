%importing the data set 
csv = readmatrix('heart_failure_clinical_records_dataset.csv');

% defining the variables 
age = csv(:,1)
anaemia = csv(:,2)
creatinine = csv(:,3)
diabetes = csv(:,4)
ejection = csv(:,5)
hbp = csv(:,6)
platelets = csv(:,7)
serum = csv(:,8)
serum_sod = csv(:,9)
sex = csv(:,10)
smoking = csv(:,11)
time = csv(:,12)
death_event = csv(:,13)

% Column 1: age

age_out = find(isoutlier(age.'))
invalid_age = find(age < 0);
fprintf('Invalid Ages: %i\n', length(invalid_age));

% Column 2: anaemia

invalid_anaemia = find(anaemia < 0 | anaemia > 1);
fprintf('Invalid Anaemia: %i\n', length(invalid_anaemia));

% Column 3: cpk (creatinine phosphokinase)

creatinine_out = find(isoutlier(creatinine.'))
invalid_cpk = find(creatinine < 0);
fprintf('Invalid CPK: %i\n', length(invalid_cpk));

% Column 4: diabetes

invalid_diabetes = find(diabetes < 0 | diabetes > 1);
fprintf('Invalid Diabetes: %i\n', length(invalid_diabetes));

% Column 5: ef (ejection fraction)

ejection_out = find(isoutlier(ejection.'))
invalid_ef = find(ejection < 0 | ejection > 100);
fprintf('Invalid EF: %i\n', length(invalid_ef));

% Column 6: hbp (high blood pressure)

invalid_hbp = find(hbp < 0 | hbp > 1);
fprintf('Invalid HBP: %i\n', length(invalid_hbp));

% Column 7: platelets

platelets_out = find(isoutlier(platelets.'))
invalid_platelets = find(platelets < 0);
fprintf('Invalid Platelets: %i\n', length(invalid_platelets));

% Column 8: sc (serum creatinine)

serum_out = find(isoutlier(serum.'))
invalid_sc = find(serum < 0);
fprintf('Invalid SC: %i\n', length(invalid_sc));

% Column 9: serum sodium

serumSod_out = find(isoutlier(serum_sod.'))
invalid_ss = find(serum_sod < 0);
fprintf('Invalid SS: %i\n', length(invalid_ss));

% Column 10: sex

invalid_sex = find(sex < 0 | sex > 1);
fprintf('Invalid Sex: %i\n', length(invalid_sex));

% Column 11: smoking

invalid_smoking = find(smoking < 0 | smoking > 1);
fprintf('Invalid Smoking: %i\n', length(invalid_smoking));

% Column 12: time

time_out = find(isoutlier(time.'))
invalid_time = find(time < 0);
fprintf('Invalid Time: %i\n', length(invalid_time));

% Column 13: death

invalid_death = find(death_event < 0 | death_event > 1);
fprintf('Invalid Death: %i\n', length(invalid_death));

