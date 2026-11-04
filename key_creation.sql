--Set a primary key:
ALTER TABLE til_portfolio_projects.fy_ds55_lego.lego_themes
 ADD PRIMARY KEY (theme_id);

 select *
 from lego_inventory_sets;

ALTER TABLE til_portfolio_projects.fy_ds55_lego.lego_sets
 ADD PRIMARY KEY (set_number);

ALTER TABLE til_portfolio_projects.fy_ds55_lego.lego_sets ADD FOREIGN KEY (theme_id) REFERENCES til_portfolio_projects.fy_ds55_lego.lego_themes(theme_id);

-- ALTER TABLE til_portfolio_projects.fy_ds55_lego.lego_sets RENAME COLUMN set_theme_id TO theme_id;

ALTER TABLE til_portfolio_projects.fy_ds55_lego.lego_inventories
 ADD PRIMARY KEY (inventory_id);

ALTER TABLE til_portfolio_projects.fy_ds55_lego.lego_inventories ADD FOREIGN KEY (set_num) REFERENCES til_portfolio_projects.fy_ds55_lego.lego_sets(set_number);

ALTER TABLE til_portfolio_projects.fy_ds55_lego.lego_inventory_sets
DROP PRIMARY KEY;

ALTER TABLE til_portfolio_projects.fy_ds55_lego.lego_inventory_sets ADD FOREIGN KEY (set_number) REFERENCES til_portfolio_projects.fy_ds55_lego.lego_sets(set_number);

ALTER TABLE til_portfolio_projects.fy_ds55_lego.lego_part_categories
 ADD PRIMARY KEY (part_category_id);

ALTER TABLE til_portfolio_projects.fy_ds55_lego.lego_parts
 ADD PRIMARY KEY (part_number);

ALTER TABLE til_portfolio_projects.fy_ds55_lego.lego_parts ADD FOREIGN KEY (part_category_id) REFERENCES til_portfolio_projects.fy_ds55_lego.lego_part_categories(part_category_id);

 select *
 from lego_colors;

ALTER TABLE til_portfolio_projects.fy_ds55_lego.lego_colors
 ADD PRIMARY KEY (color_id);

ALTER TABLE til_portfolio_projects.fy_ds55_lego.lego_inventory_parts ADD FOREIGN KEY (inventory_id) REFERENCES til_portfolio_projects.fy_ds55_lego.lego_inventories(inventory_id);
ALTER TABLE til_portfolio_projects.fy_ds55_lego.lego_inventory_parts ADD FOREIGN KEY (part_num) REFERENCES til_portfolio_projects.fy_ds55_lego.lego_parts(part_number);
ALTER TABLE til_portfolio_projects.fy_ds55_lego.lego_inventory_parts ADD FOREIGN KEY (color_id) REFERENCES til_portfolio_projects.fy_ds55_lego.lego_colors(color_id);

select *
from lego_inventory_parts;