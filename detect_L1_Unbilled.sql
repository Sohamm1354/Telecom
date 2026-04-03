CREATE OR REPLACE TABLE `revenue-assurance-491605.telecom_ra.result_L1` AS

SELECT
    c.cdr_id,
    c.subscriber_id,
    'L1_unbilled' AS detected_leakage_type,
    'sql_rule' AS detection_method,
    1.0 AS detection_confidence,
    CURRENT_TIMESTAMP() AS detected_at

FROM `revenue-assurance-491605.telecom_ra.cdr_no_duplicates` c

LEFT JOIN `revenue-assurance-491605.telecom_ra.rating_events` r
ON c.cdr_id = r.cdr_id

WHERE c.mediation_status = 'success'
AND r.cdr_id IS NULL;