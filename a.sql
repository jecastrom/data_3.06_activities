DROP VIEW IF EXISTS last_week_withdrawals;
CREATE VIEW last_week_withdrawals AS WITH cte_1 AS (
    SELECT
        *
    FROM
        trans
    WHERE
        date BETWEEN (
            SELECT
                max(date) - 6
            FROM
                trans
        )
        AND (
            SELECT
                max(date)
            FROM
                trans
        )
        AND TYPE = "VYDAJ"
)
SELECT
    client_id,
    sum(amount) AS total_withdrawals
FROM
    disp
    LEFT JOIN cte_1 USING (account_id)
GROUP BY
    client_id;
SELECT
    *
FROM
    last_week_withdrawals
LIMIT
    10;