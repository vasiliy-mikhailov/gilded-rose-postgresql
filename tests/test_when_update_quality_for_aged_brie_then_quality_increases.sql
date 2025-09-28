BEGIN;
SELECT plan(1);

TRUNCATE TABLE item;
SELECT new_item('Aged Brie', 5, 10);

SELECT update_quality();

-- Качество должно увеличиться на 1
SELECT is(
    (SELECT quality::int FROM item LIMIT 1),
    11,
    'Aged Brie quality increases with age'
);

SELECT * FROM finish();
ROLLBACK;

