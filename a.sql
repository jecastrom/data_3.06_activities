SELECT
    client_id,
    dob,
    date_format(
        str_to_date(dob, '%y%m%d %H:%i:%s'),
        '%Y-%m-%d %H:%i:%s'
    ) AS dob2,
    gender
FROM
    client_demographics
LIMIT
    10;