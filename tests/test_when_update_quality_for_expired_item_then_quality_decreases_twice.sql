BEGIN;
SELECT plan(1);

TRUNCATE TABLE item;
SELECT new_item('expired', -1, 6);

SELECT update_quality();

-- Срок прошёл, качество должно упасть на 2
SELECT is(
    (SELECT quality::int FROM item LIMIT 1),
    4,
    'expired item quality decreased twice as fast'
);

SELECT * FROM finish();
ROLLBACK;

