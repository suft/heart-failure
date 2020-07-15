csv = readmatrix('heart_failure_clinical_records_dataset.csv');

% Column 1: age
invalid_age = find(csv(:, 1) < 0);
fprintf('Invalid Ages: %i\n', length(invalid_age));

% Column 2: anaemia
invalid_anaemia = find(csv(:, 2) < 0 | csv(:, 2) > 1);
fprintf('Invalid Anaemia: %i\n', length(invalid_anaemia));

% Column 3: cpk (creatinine phosphokinase)
invalid_cpk = find(csv(:, 3) < 0);
fprintf('Invalid CPK: %i\n', length(invalid_cpk));

% Column 4: diabetes
invalid_diabetes = find(csv(:, 4) < 0 | csv(:, 4) > 1);
fprintf('Invalid Diabetes: %i\n', length(invalid_diabetes));

% Column 5: ef (ejection fraction)
invalid_ef = find(csv(:, 5) < 0 | csv(:, 6) > 100);
fprintf('Invalid EF: %i\n', length(invalid_ef));

% Column 6: hbp (high blood pressure)
invalid_hbp = find(csv(:, 6) < 0 | csv(:, 6) > 1);
fprintf('Invalid HBP: %i\n', length(invalid_hbp));

% Column 7: platelets
invalid_platelets = find(csv(:, 7) < 0);
fprintf('Invalid Platelets: %i\n', length(invalid_platelets));

% Column 8: sc (serum creatinine)
invalid_sc = find(csv(:, 8) < 0);
fprintf('Invalid SC: %i\n', length(invalid_sc));

% Column 9: serum sodium
invalid_ss = find(csv(:, 9) < 0);
fprintf('Invalid SS: %i\n', length(invalid_ss));

% Column 10: sex
invalid_sex = find(csv(:, 10) < 0 | csv(:, 10) > 1);
fprintf('Invalid Sex: %i\n', length(invalid_sex));

% Column 11: smoking
invalid_smoking = find(csv(:, 11) < 0 | csv(:, 11) > 1);
fprintf('Invalid Smoking: %i\n', length(invalid_smoking));

% Column 12: time
invalid_time = find(csv(:, 12) < 0);
fprintf('Invalid Time: %i\n', length(invalid_time));

% Column 13: death
invalid_death = find(csv(:, 13) < 0 | csv(:, 13) > 1);
fprintf('Invalid Death: %i\n', length(invalid_death));

