# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@g1 = Group.create!(label: "Traditional Celtic names")

@g1a = Subgroup.create!(group: @g1)
@n1a1 = Nameset.create!(label: "Scottish male", subgroup: @g1a)
Name.create!(nameset: @n1a1, variants: "Boisil")
Name.create!(nameset: @n1a1, variants: "Feargan")
Name.create!(nameset: @n1a1, variants: "Taran")
@n1a2 = Nameset.create!(label: "Irish male", subgroup: @g1a)

@g1b = Subgroup.create!(group: @g1)
@n1b1 = Nameset.create!(label: "Scottish female", subgroup: @g1b)
Name.create!(nameset: @n1b1, variants: "Brianag")
Name.create!(nameset: @n1b1, variants: "Fionnghuala")
Name.create!(nameset: @n1b1, variants: "Muireall")
@n1b2 = Nameset.create!(label: "Irish female", subgroup: @g1b)

g2 = Group.create!(label: "Traditional Germanic names")

g2a = Subgroup.create!(group: g2)
ns2a1 = Nameset.create!(label: "Frankish male", subgroup: g2a)
Name.create!(nameset: ns2a1, variants: "Einhard")
Name.create!(nameset: ns2a1, variants: "Nordbert")
ns2a2 = Nameset.create!(label: "Gothic male", subgroup: g2a)
Name.create!(nameset: ns2a2, variants: "Ermanaric")
Name.create!(nameset: ns2a2, variants: "Totila")
ns2a3 = Nameset.create!(label: "Norse male", subgroup: g2a)
Name.create!(nameset: ns2a3, variants: "Lodin")
Name.create!(nameset: ns2a3, variants: "Urm")

g2b = Subgroup.create!(group: g2)
ns2b1 = Nameset.create!(label: "Frankish female", subgroup: g2b)
# no names
# no names
ns2b2 = Nameset.create!(label: "Gothic female", subgroup: g2b)
Name.create!(nameset: ns2b2, variants: "Helchen")
Name.create!(nameset: ns2b2, variants: "Sunigilda")
ns2b3 = Nameset.create!(label: "Norse female", subgroup: g2b)
Name.create!(nameset: ns2b3, variants: "Asa")
Name.create!(nameset: ns2b3, variants: "Gunnhild")

g3 = Group.create!(label: "Other traditional names")
