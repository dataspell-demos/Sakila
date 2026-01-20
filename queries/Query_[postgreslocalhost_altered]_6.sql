INSERT INTO category (category_id, name, last_update)
SELECT category_id, name, last_update
FROM category
WHERE
    (category_id = 2 AND name = 'Animation' AND last_update = '2006-02-15 04:46:27.000000'
        OR category_id = 3 AND name = 'Children' AND last_update = '2006-02-15 04:46:27.000000'
        OR category_id = 4 AND name = 'Classics' AND last_update = '2006-02-15 04:46:27.000000'
        OR category_id = 5 AND name = 'Comedy' AND last_update = '2006-02-15 04:46:27.000000'
        OR category_id = 6 AND name = 'Documentary' AND last_update = '2006-02-15 04:46:27.000000'
        OR category_id = 7 AND name = 'Drama' AND last_update = '2006-02-15 04:46:27.000000'
        OR category_id = 8 AND name = 'Family' AND last_update = '2006-02-15 04:46:27.000000'
        OR category_id = 9 AND name = 'Foreign' AND last_update = '2006-02-15 04:46:27.000000'
        OR category_id = 10 AND name = 'Games' AND last_update = '2006-02-15 04:46:27.000000'
        OR category_id = 11 AND name = 'Horror' AND last_update = '2006-02-15 04:46:27.000000'
        OR category_id = 12 AND name = 'Music' AND last_update = '2006-02-15 04:46:27.000000')