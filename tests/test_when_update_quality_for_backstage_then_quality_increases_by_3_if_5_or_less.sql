BEGIN;
SELECT plan(1);

TRUNCATE TABLE item;
SELECT new_item('Backstage passes to a TAFKAL80ETC concert', 5, 20);

SELECT update_quality();

-- Увеличение на 3
SELECT is(
    (SELECT quality::int FROM item LIMIT 1),
    23,
    'Backstage quality increases by 3 when 5 days or less'
);

SELECT * FROM finish();
ROLLBACK;

