BEGIN;
SELECT plan(1);

TRUNCATE TABLE item;
SELECT new_item('Aged Brie', 5, 50);

SELECT update_quality();

-- Качество не может быть выше 50
SELECT is(
    (SELECT quality::int FROM item LIMIT 1),
    50,
    'quality never exceeds 50'
);

SELECT * FROM finish();
ROLLBACK;

