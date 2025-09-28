BEGIN;
-- Plan count must match the number of tests
SELECT plan(1);

-- Given
TRUNCATE TABLE item;
SELECT new_item('foo', 10, 5);

-- When
SELECT update_quality();

-- Then: 'foo' is a normal item, quality should decrease by 1
SELECT is(
    (SELECT quality::int FROM item LIMIT 1),
    4,
    'normal item quality decreased by 1'
);

-- Finish the tests and clean up
SELECT * FROM finish();
ROLLBACK;

