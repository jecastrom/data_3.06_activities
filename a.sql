WITH cte_1 AS (
    SELECT
        district_id,
        floor(avg(amount)) AS avg_amount_loan
    FROM
        loan
        INNER JOIN account USING (account_id)
    GROUP BY
        district_id
)
SELECT
    a.district_id,
    d.a2 AS district,
    l.loan_id,
    format(l.amount, 2, 'de_DE') AS loan_amount
FROM
    loan l
    INNER JOIN account a USING (account_id)
    INNER JOIN district d ON a.district_id = d.a1
    INNER JOIN cte_1 c USING (district_id)
WHERE
    amount > avg_amount_loan
ORDER BY
    amount DESC
LIMIT
    5;