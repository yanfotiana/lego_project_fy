-- Query to check schema
SELECT *
FROM til_portfolio_projects.staging.lego_colors;

-- Check column character length, for varchar() length
SELECT MAX(LENGTH(name))
FROM til_portfolio_projects.staging.lego_parts;

-- Create tables

CREATE TABLE til_portfolio_projects.fy_ds55_lego.lego_parts (
	part_number VARCHAR(15),
	part_name VARCHAR(223),
    part_category_id INTEGER
);

SELECT *
FROM lego_parts;

CREATE TABLE til_portfolio_projects.fy_ds55_lego.lego_sets (
	set_number varchar(20),
	set_name varchar(100),
	set_year smallint,
	set_theme_id smallint,
	set_total_parts smallint
);

CREATE TABLE til_portfolio_projects.fy_ds55_lego.lego_themes (
	theme_id smallint,
	theme_name varchar(50),
	theme_parent_id smallint
);

CREATE TABLE til_portfolio_projects.fy_ds55_lego.lego_part_categories (
	part_category_id integer,
	part_category_name varchar(50)
);

CREATE TABLE til_portfolio_projects.fy_ds55_lego.lego_inventory_sets (
	inventory_id smallint,
	set_number varchar(10),
	inventory_set_quantity smallint
	);


CREATE TABLE til_portfolio_projects.fy_ds55_lego.lego_colors (
	color_id smallint,
	color_name varchar(50),
	rgb varchar(6),
	is_trans varchar(1)
);

CREATE TABLE til_portfolio_projects.fy_ds55_lego.lego_inventories (
	inventory_id smallint,
	version smallint,
	set_num varchar(20)
);

CREATE TABLE til_portfolio_projects.fy_ds55_lego.lego_inventory_parts (
	inventory_id smallint,
	part_num varchar(15),
	color_id smallint,
	quantity smallint,
	is_spare varchar(1)
);

-- Load data into tables
INSERT INTO til_portfolio_projects.fy_ds55_lego.lego_colors (
	SELECT * FROM til_portfolio_projects.staging.lego_colors
);

INSERT INTO til_portfolio_projects.fy_ds55_lego.lego_inventories (
	SELECT * FROM til_portfolio_projects.staging.lego_inventories
);

INSERT INTO til_portfolio_projects.fy_ds55_lego.lego_inventory_parts (
	SELECT * FROM til_portfolio_projects.staging.lego_inventory_parts
);

INSERT INTO til_portfolio_projects.fy_ds55_lego.lego_inventory_sets (
	SELECT * FROM til_portfolio_projects.staging.lego_inventory_sets
);

INSERT INTO til_portfolio_projects.fy_ds55_lego.lego_part_categories (
	SELECT * FROM til_portfolio_projects.staging.lego_part_categories
);

INSERT INTO til_portfolio_projects.fy_ds55_lego.lego_parts (
	SELECT * FROM til_portfolio_projects.staging.lego_parts
);

INSERT INTO til_portfolio_projects.fy_ds55_lego.lego_sets (
	SELECT * FROM til_portfolio_projects.staging.lego_sets
);

INSERT INTO til_portfolio_projects.fy_ds55_lego.lego_themes (
	SELECT 
		id,
		name,
		CAST(parent_id as smallint)
	FROM til_portfolio_projects.staging.lego_themes
);

