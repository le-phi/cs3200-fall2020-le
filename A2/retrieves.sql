# 1a.
SELECT 
    d.id
FROM
    developers d;

# 1b.
SELECT 
    d.id
FROM
    developers d
WHERE
    d.id = 34;

# 1c.
SELECT 
    d.id
FROM
    developers d
        JOIN
    website_roles wr ON d.id = wr.developer_id
        AND wr.role != 'owner'
        AND wr.website_id = (SELECT w.id FROM websites w WHERE w.name = 'Twitter');
            
# 1d.
SELECT DISTINCT
    d.id
FROM
    developers d
        JOIN
    pages p ON p.views < 300000
        JOIN
    page_roles pr ON d.id = pr.developer_id
        AND pr.role = 'reviewer'
        AND p.id = pr.page_id;

# 1e.
SELECT 
    d.id
FROM
    developers d
        JOIN
    widgets w ON w.dtype = 'heading'
		AND w.page_id = (SELECT p.id FROM pages p WHERE p.title = 'Home')
        JOIN
    page_roles pr ON d.id = pr.developer_id
        AND pr.role = 'writer'
        AND pr.page_id = (SELECT p.id FROM pages p WHERE p.title = 'Home');
        
# 2a.
SELECT 
    w.id
FROM
    websites w
ORDER BY w.visits ASC
LIMIT 1;

# 2b.
SELECT 
    w.name
FROM
    websites w
WHERE
    w.id = 678;
    
# 2c.
SELECT 
    w.id
FROM
    websites w
        JOIN
    pages pg ON w.id = pg.website_id
        JOIN
    widgets wg ON pg.id = wg.page_id
        AND wg.dtype = 'youtube'
        JOIN
    page_roles pr ON pg.id = pr.page_id
        AND pr.role = 'reviewer'
        JOIN
    developers d ON pr.developer_id = d.id
        JOIN
    persons p ON d.id = p.id AND p.first_name = 'Bob';

# 2d.
SELECT 
    w.id
FROM
    websites w
        JOIN
    website_roles wr ON w.id = wr.website_id
        AND wr.role = 'owner'
        AND wr.developer_id = (SELECT 
            p.id
        FROM
            persons p
        WHERE
            p.username = 'alice');

# 2e.
SELECT 
    w.id
FROM
    (SELECT 
        *
    FROM
        websites
    WHERE
        websites.visits > 6000000) AS w
        JOIN
    website_roles wr ON w.id = wr.website_id
        AND wr.role = 'admin'
        AND wr.developer_id = (SELECT 
            p.id
        FROM
            persons p
        WHERE
            p.username = 'charlie');

# 3a.
SELECT
	p.id
FROM
	pages p
ORDER BY
	p.views DESC
LIMIT 1;

# 3b.
SELECT
	p.title
FROM
	pages p
WHERE
	p.id = 234;
    
# 3c.
SELECT 
    page_id
FROM
    page_roles pr
WHERE
    pr.role = 'editor'
        AND pr.developer_id = (SELECT 
            p.id
        FROM
            persons p
        WHERE
            p.username = 'alice');

# 3d.
SELECT 
    SUM(p.views) AS total_views
FROM
    (SELECT 
        *
    FROM
        pages pg
    WHERE
        pg.website_id = (SELECT 
                w.id
            FROM
                websites w
            WHERE
                w.name = 'CNET')) AS p;

# 3e.
SELECT 
    AVG(p.views) AS avg_views
FROM
    (SELECT 
        *
    FROM
        pages pg
    WHERE
        pg.website_id = (SELECT 
                w.id
            FROM
                websites w
            WHERE
                w.name = 'Wikipedia')) AS p;

# 4a.
SELECT 
    w.id
FROM
    widgets w
WHERE
    w.page_id = (SELECT 
            p.id
        FROM
            pages p
        WHERE
            p.title = 'home'
                AND p.website_id = (SELECT 
                    wb.id
                FROM
                    websites wb
                WHERE
                    wb.name = 'CNET'));
                    
# 4b.
SELECT 
    w.id
FROM
    widgets w
WHERE
    w.page_id = (SELECT 
            p.id
        FROM
            pages p
        WHERE
            p.website_id = (SELECT 
                    wb.id
                FROM
                    websites wb
                WHERE
                    wb.name = 'CNN'));
                    
# 4c.
SELECT 
    *
FROM
    (SELECT 
        *
    FROM
        widgets wd
    WHERE
        wd.dtype = 'image') AS w
        JOIN
    pages p ON p.id = w.page_id
        JOIN
    page_roles pr ON p.id = pr.page_id
        AND pr.role = 'reviewer'
        AND pr.developer_id = (SELECT 
            p.id
        FROM
            persons p
        WHERE
            p.username = 'alice');
            
# 4d.
SELECT 
    COUNT(*) AS widget_count
FROM
    widgets w
        JOIN
    pages p ON p.id = w.page_id
        JOIN
    websites wb ON wb.id = p.website_id
        AND wb.name = 'Wikipedia';
        
# 5a.
SELECT 
    w.name
FROM
    websites w
        JOIN
    website_priviledges wr ON w.id = wr.website_id
        AND wr.priviledge = 'delete'
        AND wr.developer_id = (SELECT 
            p.id
        FROM
            persons p
        WHERE
            p.first_name = 'Bob');
            
# 5b.
SELECT 
    p.title
FROM
    pages p
        JOIN
    page_priviledges pr ON p.id = pr.page_id
        AND pr.priviledge = 'create'
        AND pr.developer_id = (SELECT 
            p.id
        FROM
            persons p
        WHERE
            p.username = 'charlie');
	