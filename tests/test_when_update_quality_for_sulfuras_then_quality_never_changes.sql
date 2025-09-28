BEGIN;
SELECT plan(1);

TRUNCATE TABLE item;
SELECT new_item('Sulfuras, Hand of Ragnaros', 0, 80);

SELECT update_quality();

-- Sulfuras всегда остаётся 80
SELECT is(
    (SELECT quality::int FROM item LIMIT 1),
    80,
    'Sulfuras quality never changes'
);

SELECT * FROM finish();
ROLLBACK;

