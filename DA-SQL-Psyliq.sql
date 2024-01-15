use `diabetes-da`;
select * from db;

#1. Retrieve the Patient_id and ages of all patients
select Patient_id,age from db;

#2.Select all female patients who are older than 40.
select gender, age from db 
where gender='Female' and age > 40;

#3.Calculate the average BMI of patients.
select avg(bmi) as Avg_BMI from db;

#4.List patients in descending order of blood glucose levels
select EmployeeName, blood_glucose_level from db 
order by blood_glucose_level desc;

#5. Find patients who have hypertension and diabetes.
select Employeename, hypertension, diabetes from db 
where hypertension=1 and diabetes= 1;

#6. Determine the number of patients with heart disease.
select count(Patient_id) as patient_heart_disease  from db 
where heart_disease = 1;

#7.Group patients by smoking history and count how many smokers and non-smokers there are.
SELECT smoking_history, COUNT(*) as count
FROM db
GROUP BY smoking_history;

#8. Retrieve the Patient_ids of patients who have a BMI greater than the average BMI
select patient_id, bmi from db 
where bmi> (select avg(bmi) from db);

#9. Find the patient with the highest HbA1c level and the patient with the lowest HbA1clevel.
select patient_id, HbA1c_level as highest_level from db
where HbA1c_level= (select max(HbA1c_level) from db);
select patient_id,HbA1c_level as lowest_level from db
where HbA1c_level=(select min(HbA1c_level) from db);

#10.Calculate the age of patients in years (assuming the current date as of now).
select patient_id, (year(now())-age) as date_of_birth from db;

#11.Rank patients by blood glucose level within each gender group.
select patient_id, gender,blood_glucose_level, 
rank()over(partition by gender order by blood_glucose_level desc) as glucose_rank from db;

#12. Update the smoking history of patients who are older than 50 to "Ex-smoker."
update db 
set smoking_history='Ex-smoker'
where age>50;

#13. Insert a new patient into the database with sample data.
insert into db (EmployeeName,Patient_id,gender,age,hypertension,
heart_disease,smoking_history,bmi,HbA1c_level,blood_glucose_level,diabetes)
values ('John Lewis', 'PT46924','Male','64','0','0','Never','87.31','7','155','0');

#14. Delete all patients with heart disease from the database.
delete from db 
where heart_disease=1;

#15.Find patients who have hypertension but not diabetes using the EXCEPT operator.
SELECT patient_id, hypertension
FROM db
WHERE hypertension=1 EXCEPT
SELECT patient_id, hypertension
FROM db
WHERE diabetes=1;

#16.Define a unique constraint on the "patient_id" column to ensure its values are unique.
alter table  db
add constraint uniquePatientID unique(patient_id(6));

#17. Create a view that displays the Patient_ids, ages, and BMI of patients.
create view Patient_details as
select patient_id,age,bmi from db;

select * from patient_details;











