Group has many Subgroups. Subgroup hes many Namestes. Nameset has many Names. Name may have one name or many variants of the same name (both are plain string).

Group, Subgroup, Nameset, Name: all have position column.

Group and Nameset have label column.

Subgroup is just for better layout and structure. It has no label.

Nameset model
| attribute          | type    |
|--------------------+---------|
| label              | string  |
| subgroup           | ref     |
| position           | integer |
| source             | text    |
| name_separator     | string  |
| variant_separator  | string  |

Name model
| attribute | type   |
|-----------+--------|
| variants  | text |
| nameset   | ref    |
| position  | integer |

SubGroup model
| attribute | type    |
|-----------+---------|
| group     | ref     |
| position  | integer |

Group model
| attribute | type    |
|-----------+---------|
| label     | string  |
| position  | integer |

group has many subgroups
subgroup belongs to group
subgroup has many namesets
nameset belongs to subgroup
nameset has many names
name belongs to nameset

| Endpoint                    | Functionality |
|-----------------------------+---------------|
| GET /groups                 |               |
| GET /groups/:id/subgroups   |               |
| GET /subgroup/:id/namesets  |               |
| GET /namesets/:id/names     |               |
| GET /namesets/:id/filters   |               |
| GET /namesets/:id/splitters |               |
