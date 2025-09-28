BEGIN;
SELECT plan(1);

TRUNCATE TABLE item;
SELECT new_item('nonnegative', 5, 0);

SELECT update_quality();

-- Качество не может быть меньше 0
SELECT is(
    (SELECT quality::int FROM item LIMIT 1),
    0,
    'quality never goes below 0'
);

SELECT * FROM finish();
ROLLBACK;

