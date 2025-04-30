

SELECT
    ps.PatientId
    , ps.Hospital
    , ps.Ward 
    , ps.AdmittedDate
    , ps.DischargeDate 
    , DATEDIFF(DAY, ps.AdmittedDate, ps.DischargeDate) AS Lengthofstay
    , DATEADD (DAY, -14, ps.AdmittedDate) AS reminderdate
    , ps.Tariff
    , ps.Ethnicity
FROM PatientStay ps
WHERE ps.Hospital IN ('PRUH', 'OXLEAS')
AND ps.ward LIKE '%Surgery'
--AND ps.AdmittedDate BETWEEN '2024-02-27'AND '2024-03-01'
ORDER BY ps.AdmittedDate DESC, ps.PatientId DESC





SELECT
ps.Hospital
,ps.Ward
, COUNT (*) as numberofpatients
,SUM(ps.Tariff) as TotalTariff
,AVG(ps.Tariff) as AverageTariff
,MIN(ps.Tariff) as MinTariff
,MAX(ps.Tariff) as MaxTariff
FROM PatientStay ps
GROUP BY ps.Hospital,ps.Ward
--ORDER BY ps.Hospital, ps.Ward
ORDER BY Numberofpatients desc

    
SELECT 
ps.PatientId
, ps.AdmittedDate
, dh.HospitalType
, dh.HospitalSize 
FROM PatientStay ps
INNER JOIN DimHospitalBad dh ON ps.Hospital = dh.Hospital
WHERE dh.Hospital IS NULL


