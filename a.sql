WITH cte_1 AS(
    SELECT
        district_id,
        account_id,
        date,
        rank() over (
            PARTITION by district_id
            ORDER BY
                date
        ) AS acc_op_rank
    FROM
        account
)
SELECT
    a2 AS district,
    account_id,
    `date` AS first_account_opening_date
FROM
    cte_1 ct
    INNER JOIN district d ON ct.district_id = d.a1
WHERE
    acc_op_rank = 1
ORDER BY
    1
LIMIT
    5;