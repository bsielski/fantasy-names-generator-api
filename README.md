Nameset model
| attribute          | type    |
|--------------------+---------|
| label              | string  |
| subgroup           | ref     |
| position           | integer |
| source             | string  |
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
