
%Import the excel data to matlab 
csv = readmatrix('heart_failure_clinical_records_dataset.csv');

%Take the data from the matrix and assign it to the related variable 
diabetes = csv(:, 4);
smoking = csv(:, 11);
deathEvent = csv(:, 13);
age = csv(:,1);

%Using the follwoing code, we find out how many people who got herat
%failure had diabetes and how many did not have diabetes 
haveDiabetes = 0;
noDiabetes = 0;

for a = 1 : length(diabetes)

    if diabetes(a) == 1
        haveDiabetes = haveDiabetes + 1; 
        
    elseif diabetes(a) == 0
        noDiabetes = noDiabetes + 1; 

    end
    
end
haveDiabetes
noDiabetes

%Using the follwoing code, we find out how many people who got herat
%failure were smoking and how many were not smoking  
wereSmoking = 0;
notSmoking = 0;

for b = 1 : length(smoking)

    if smoking(b) == 1
        wereSmoking = wereSmoking + 1; 
        
    elseif smoking(b) == 0
        notSmoking = notSmoking + 1; 

    end
    
end
wereSmoking
notSmoking

%Using the follwoing code, we find out how many people who got herat
%failure dead and how many lived  
yesDead = 0;
notDead = 0;

for c = 1 : length(deathEvent)
    
    if deathEvent(c) == 1      
        yesDead = yesDead + 1; 
        
    elseif deathEvent(c) == 0
        notDead = notDead + 1; 
        
    end    
end
yesDead
notDead

%Using the follwoing code, we find out how many people who got herat
%failure were adult and how many were elders 

a65 = 0;
a55 = 0;
less55 = 0;

for d = 1 : length(age)
    
    if age(d) > 65
       a65 = a65 + 1; 
        
    elseif age(d) < 65 && age(d) > 55
        a55 = a55 + 1;
        
    elseif age(d) < 55
        less55 = less55 + 1; 
        
    end    
end
adult
elders

%Here, we plot our data using pie chart 
plotDi(1) = haveDiabetes;
plotDi(2) = noDiabetes;

plotSm(1) = wereSmoking;
plotSm(2) = notSmoking;

plotDv(1) = yesDead;
plotDv(2) = notDead;

plotAg(1) = a65;
plotAg(2) = a55;
plotAg(3) = less55;


subplot(2,2,1);
pie(plotDi);
legend('Diabetes','No Diabetes');


subplot(2,2,2);
pie(plotDi);
legend('Smoking','Not Smoking');

subplot(2,2,3);
pie(plotDv);
legend('Dead','Not Dead');

subplot(2,2,4);
pie(plotAg);
legend('65+','55 > && < 65','<55')

