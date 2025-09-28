BEGIN;
SELECT plan(1);

TRUNCATE TABLE item;
SELECT new_item('Backstage passes to a TAFKAL80ETC concert', 0, 20);

SELECT update_quality();

-- После концерта качество = 0
SELECT is(
    (SELECT quality::int FROM item LIMIT 1),
    0,
    'Backstage quality drops to 0 after the concert'
);

SELECT * FROM finish();
ROLLBACK;
