select * from stg_churn01

select Gender,count(Gender) from stg_churn01 Group by Gender;

select Gender, count(Gender) as C, (count(Gender)*1.0/(select count(*) from stg_churn01))*100 as Percentages from stg_churn01 Group by Gender;
-- We have more female customers than male.

Select Gender,Customer_Status,count(Gender) as Gender_count, Count(Customer_Status)  as Status_Count from stg_churn01 
Group by Gender,Customer_Status order By Gender asc
--More females(1111) tend to churn then Males(621).More Female(2668) tend to stay then Males(1607)

select Contract,count(Contract) as Total_count,Sum(Total_Revenue) as TotalRev,
(Sum(Total_Revenue)*1.0/(select sum(Total_Revenue) from stg_churn01))*100 as RevenuePercent ,
(count(Contract)*1.0/(SELECT count(*)from stg_churn01))*100 as percentages from stg_churn01 Group by Contract;
-- 2 year contract is making more revenue that is 42% as compared to the others.Customers are choosing Month to Month contract more that is 51%.

select Churn_Category,Churn_Reason,Customer_Status from stg_churn01

select Customer_Status , count(Customer_Status)as Total_count,Sum(Total_Revenue) as TotalRev,
(Sum(Total_Revenue)*1.0/(select sum(Total_Revenue) from stg_churn01))*100 as RevenuePercent from stg_churn01 Group By Customer_Status;
-- We are losing 17.5% of the total revenue because of the churned customers.

Select Gender, Churn_Category, count(Gender) as Gender_count,count(Churn_Category)as Churn_Category_count,
(Count(Churn_Category)*1.0/(select count(Churn_Category) from stg_churn01))*100 from stg_churn01 
Group by Gender, Churn_Category order by Gender asc
--We observe 'competitor' serve as the main reason for customer churn in both females and máles.

Select Gender,State, count(state) as state_count, count(Gender) as gender_count,
(count(Gender)*1.0/(select count(state) from stg_churn01))*100 as percentage from stg_churn01 
group by Gender, State order by Gender asc, state_count desc
-- we observe more female customer in State 'Tamil Nadu' and more Male customers in 'Uttar Pradesh'

select
SUM(case when Customer_ID IS NULL then 1 else 0 end)as Customer_id_null,
SUM (case when Gender IS NULL then 1 else 0 end)as Gender_null,
sum(case when Age IS NULL then 1 else 0 end)as Age_null,
sum(case when Married IS NULL then 1 else 0 end)as Married_null,
sum(case when State IS NULL then 1 else 0 end)as State_null,
sum(case when Number_of_Referrals IS NULL then 1 else 0 end)as Number_of_Refferals_null,
sum(case when Tenure_in_Months IS NULL then 1 else 0 end)as Tenure_in_months_null,
sum(case when Value_Deal IS NULL then 1 else 0 end)as Value_Deal_null,
sum(case when Phone_Service IS NULL then 1 else 0 end)as Phone_Service_null,
SUM(CASE WHEN Multiple_Lines IS NULL THEN 1 ELSE 0 END) AS Multiple_Lines_Null_Count,
SUM(CASE WHEN Internet_Service IS NULL THEN 1 ELSE 0 END) AS Internet_Service_Null_Count,
SUM(CASE WHEN Internet_Type IS NULL THEN 1 ELSE 0 END) AS Internet_Type_Null_Count,
SUM(CASE WHEN Online_Security IS NULL THEN 1 ELSE 0 END) AS Online_Security_Null_Count,
SUM(CASE WHEN Online_Backup IS NULL THEN 1 ELSE 0 END) AS Online_Backup_Null_Count,
SUM(CASE WHEN Device_Protection_Plan IS NULL THEN 1 ELSE 0 END) AS Device_Protection_Plan_Null_Count,
SUM(CASE WHEN Premium_Support IS NULL THEN 1 ELSE 0 END) AS Premium_Support_Null_Count,
SUM(CASE WHEN Streaming_TV IS NULL THEN 1 ELSE 0 END) AS Streaming_TV_Null_Count,
SUM(CASE WHEN Streaming_Movies IS NULL THEN 1 ELSE 0 END) AS Streaming_Movies_Null_Count,
SUM(CASE WHEN Streaming_Music IS NULL THEN 1 ELSE 0 END) AS Streaming_Music_Null_Count,
SUM(CASE WHEN Unlimited_Data IS NULL THEN 1 ELSE 0 END) AS Unlimited_Data_Null_Count,
SUM(CASE WHEN Contract IS NULL THEN 1 ELSE 0 END) AS Contract_Null_Count,
SUM(CASE WHEN Paperless_Billing IS NULL THEN 1 ELSE 0 END) AS Paperless_Billing_Null_Count,
SUM(CASE WHEN Payment_Method IS NULL THEN 1 ELSE 0 END) AS Payment_Method_Null_Count,
SUM(CASE WHEN Monthly_Charge IS NULL THEN 1 ELSE 0 END) AS Monthly_Charge_Null_Count,
SUM(CASE WHEN Total_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Charges_Null_Count,
SUM(CASE WHEN Total_Refunds IS NULL THEN 1 ELSE 0 END) AS Total_Refunds_Null_Count,
SUM(CASE WHEN Total_Extra_Data_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Extra_Data_Charges_Null_Count,
SUM(CASE WHEN Total_Long_Distance_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Long_Distance_Charges_Null_Count,
SUM(CASE WHEN Total_Revenue IS NULL THEN 1 ELSE 0 END) AS Total_Revenue_Null_Count,
SUM(CASE WHEN Customer_Status IS NULL THEN 1 ELSE 0 END) AS Customer_Status_Null_Count,
SUM(CASE WHEN Churn_Category IS NULL THEN 1 ELSE 0 END) AS Churn_Category_Null_Count,
SUM(CASE WHEN Churn_Reason IS NULL THEN 1 ELSE 0 END) AS Churn_Reason_Null_Count
FROM stg_churn01;
-- we get the null values in each column

--we remove  null values and store the resulting table in new table

SELECT 
    Customer_ID,
    Gender,
    Age,
    Married,
    State,
    Number_of_Referrals,
    Tenure_in_Months,
    ISNULL(Value_Deal, 'None') AS Value_Deal,
    Phone_Service,
    ISNULL(Multiple_Lines, 'No') As Multiple_Lines,
    Internet_Service,
    ISNULL(Internet_Type, 'None') AS Internet_Type,
    ISNULL(Online_Security, 'No') AS Online_Security,
    ISNULL(Online_Backup, 'No') AS Online_Backup,
    ISNULL(Device_Protection_Plan, 'No') AS Device_Protection_Plan,
    ISNULL(Premium_Support, 'No') AS Premium_Support,
    ISNULL(Streaming_TV, 'No') AS Streaming_TV,
    ISNULL(Streaming_Movies, 'No') AS Streaming_Movies,
    ISNULL(Streaming_Music, 'No') AS Streaming_Music,
    ISNULL(Unlimited_Data, 'No') AS Unlimited_Data,
    Contract,
    Paperless_Billing,
    Payment_Method,
    Monthly_Charge,
    Total_Charges,
    Total_Refunds,
    Total_Extra_Data_Charges,
    Total_Long_Distance_Charges,
    Total_Revenue,
    Customer_Status,
    ISNULL(Churn_Category, 'Others') AS Churn_Category,
    ISNULL(Churn_Reason , 'Others') AS Churn_Reason

INTO [db].[dbo].[prod_Churn]
FROM [db].[dbo].[stg_churn01];

select * from prod_Churn

create view vw_prodChurn as 
select * from prod_Churn where Customer_Status In('Churned','Stayed')

Create view vw_joined as 
select * from prod_Churn where Customer_Status = 'Joined'
