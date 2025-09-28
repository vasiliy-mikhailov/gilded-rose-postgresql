BEGIN;
SELECT plan(1);

TRUNCATE TABLE item;
SELECT new_item('Backstage passes to a TAFKAL80ETC concert', 10, 20);

SELECT update_quality();

-- Увеличение на 2
SELECT is(
    (SELECT quality::int FROM item LIMIT 1),
    22,
    'Backstage quality increases by 2 when 10 days or less'
);

SELECT * FROM finish();
ROLLBACK;

