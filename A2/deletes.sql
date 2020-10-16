# 1.
DELETE
FROM
	addresses a
WHERE
	a.id = (SELECT p.id FROM persons p WHERE p.username = 'alice')
    AND a.primary = 1;

# 2.
SET @last_order = (SELECT w.order FROM widgets w ORDER BY w.order DESC LIMIT 1);
DELETE
FROM
	widgets w
WHERE
	w.page_id = (SELECT p.id FROM pages p WHERE p.title = 'Contact')
    AND w.order = @last_order;
    
# 3.
SET @last_updated = (SELECT p.updated FROM (SELECT * FROM pages pg WHERE pg.website_id = (SELECT w.id FROM websites w WHERE w.name = 'Wikipedia')) p ORDER BY p.updated DESC LIMIT 1);
DELETE
FROM
	pages p
WHERE
	p.website_id = (SELECT w.id FROM websites w WHERE w.name = 'Wikipedia')
    AND p.updated = @last_updated;
    
# 4.
DELETE
FROM
	websites w
WHERE
	w.name = 'CNET';