# 1.
UPDATE phones p 
SET 
    p.phone = '333-444-5555'
WHERE
    p.primary = 1
        AND p.id = (SELECT 
            pn.id
        FROM
            persons pn
        WHERE
            pn.username = 'charlie');

# 2.
UPDATE widgets w
SET
	w.order = 3
WHERE
	w.name = 'head345';
UPDATE widgets w
SET
	w.order = 1
WHERE
	w.name = 'intro456';
UPDATE widgets w
SET
	w.order = 2
WHERE
	w.name = 'image345';
    
# 3.
UPDATE pages p
SET
	p.title = CONCAT('CNET - ', p.title)
WHERE
	p.website_id = (SELECT w.id FROM websites w WHERE w.name = 'CNET');

# 4.
SET @old_charlie_role = (SELECT pr.role from page_roles pr WHERE pr.developer_id = (SELECT p.id FROM persons p WHERE p.username = 'charlie') LIMIT 1);
SET @old_bob_role = (SELECT pr.role from page_roles pr WHERE pr.developer_id = (SELECT p.id FROM persons p WHERE p.username = 'bob') LIMIT 1);
UPDATE page_roles pr
SET
	pr.role = @old_charlie_role
WHERE
	pr.developer_id = (SELECT p.id FROM persons p WHERE p.username = 'bob' LIMIT 1)
    AND pr.page_id = (SELECT pg.id FROM pages pg WHERE pg.title = 'CNET - Home');
UPDATE page_roles pr
SET
	pr.role = @old_bob_role
WHERE
	pr.developer_id = (SELECT p.id FROM persons p WHERE p.username = 'charlie' LIMIT 1)
    AND pr.page_id = (SELECT pg.id FROM pages pg WHERE pg.title = 'CNET - Home');