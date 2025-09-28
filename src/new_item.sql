CREATE OR REPLACE FUNCTION new_item(
      name item.name%TYPE,
      sell_in item.sell_in%TYPE,
      quality item.quality%TYPE
  )
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
  INSERT INTO item (name, sell_in, quality) VALUES (name, sell_in, quality);
END;
$$;
