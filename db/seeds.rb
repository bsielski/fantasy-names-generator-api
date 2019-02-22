# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Group.first # because the db must be empty

  require Rails.root.join("lib", "seeds", "scottish-male.rb")
  require Rails.root.join("lib", "seeds", "irish-male.rb")
  require Rails.root.join("lib", "seeds", "welsh-male.rb")
  require Rails.root.join("lib", "seeds", "scottish-female.rb")
  require Rails.root.join("lib", "seeds", "irish-female.rb")
  require Rails.root.join("lib", "seeds", "welsh-female.rb")
  
  require Rails.root.join("lib", "seeds", "anglo-saxon-male.rb")
  require Rails.root.join("lib", "seeds", "frankish-male.rb")
  require Rails.root.join("lib", "seeds", "gothic-male.rb")
  require Rails.root.join("lib", "seeds", "norse-male.rb")
  require Rails.root.join("lib", "seeds", "frankish-female.rb")
  require Rails.root.join("lib", "seeds", "anglo-saxon-female.rb")
  require Rails.root.join("lib", "seeds", "gothic-female.rb")
  require Rails.root.join("lib", "seeds", "norse-female.rb")
  
  require Rails.root.join("lib", "seeds", "finnish-male.rb")
  require Rails.root.join("lib", "seeds", "japanese-male.rb")
  require Rails.root.join("lib", "seeds", "indian-male.rb")
  require Rails.root.join("lib", "seeds", "finnish-female.rb")
  require Rails.root.join("lib", "seeds", "japanese-female.rb")
  require Rails.root.join("lib", "seeds", "indian-female.rb")
  
  require Rails.root.join("lib", "seeds", "angels-in-judaism-and-christianity.rb")
  require Rails.root.join("lib", "seeds", "greek-mythology-male.rb")
  require Rails.root.join("lib", "seeds", "demons.rb")
  require Rails.root.join("lib", "seeds", "angels-in-islam.rb")
  require Rails.root.join("lib", "seeds", "greek-mythology-female.rb")
  
  require Rails.root.join("lib", "seeds", "countries.rb")
  require Rails.root.join("lib", "seeds", "middle-earth-regions.rb")
  
  require Rails.root.join("lib", "seeds", "ancient-greek-philosophical-concepts.rb")
  
  @g1 = Group.create!(label: "Traditional Celtic names")
  
  @g1a = Subgroup.create!(group: @g1)
  @n1a1 = Nameset.create!(label: "Scottish male", subgroup: @g1a)
  Name.create!(
    ScottishMale::NAMES.map do |variants| {nameset: @n1a1, variants: variants, position: 1,} end
  )
  @n1a2 = Nameset.create!(label: "Irish male", subgroup: @g1a)
  Name.create!(
    IrishMale::NAMES.map do |variants| {nameset: @n1a2, variants: variants, position: 2,} end
  )
  @n1a3 = Nameset.create!(label: "Welsh male", subgroup: @g1a)
  Name.create!(
    WelshMale::NAMES.map do |variants| {nameset: @n1a3, variants: variants, position: 3,} end
  )
  
  @g1b = Subgroup.create!(group: @g1)
  @n1b1 = Nameset.create!(label: "Scottish female", subgroup: @g1b)
  Name.create!(
    ScottishFemale::NAMES.map do |variants| {nameset: @n1b1, variants: variants, position: 3,} end
  )
  @n1b2 = Nameset.create!(label: "Irish female", subgroup: @g1b)
  Name.create!(
    IrishFemale::NAMES.map do |variants| {nameset: @n1b2, variants: variants, position: 2,} end
  )
  @n1b3 = Nameset.create!(label: "Welsh female", subgroup: @g1b)
  Name.create!(
    WelshFemale::NAMES.map do |variants| {nameset: @n1b3, variants: variants, position: 1,} end
  )
  
  g2 = Group.create!(label: "Traditional Germanic names")
  
  g2a = Subgroup.create!(group: g2)
  ns2a1 = Nameset.create!(label: "Anglo-Saxon male", subgroup: g2a)
  Name.create!(
    AngloSaxonMale::NAMES.map do |variants| {nameset: ns2a1, variants: variants, position: 1,} end
  )
  ns2a2 = Nameset.create!(label: "Frankish male", subgroup: g2a)
  Name.create!(
    FrankishMale::NAMES.map do |variants| {nameset: ns2a2, variants: variants, position: 2,} end
  )
  ns2a3 = Nameset.create!(label: "Gothic male", subgroup: g2a)
  Name.create!(
    GothicMale::NAMES.map do |variants| {nameset: ns2a3, variants: variants, position: 3,} end
  )
  ns2a4 = Nameset.create!(label: "Norse male", subgroup: g2a)
  Name.create!(
    NorseMale::NAMES.map do |variants| {nameset: ns2a4, variants: variants, position: 4,} end
  )
  
  g2b = Subgroup.create!(group: g2)
  ns2b1 = Nameset.create!(label: "Anglo-Saxon female", subgroup: g2b)
  Name.create!(
    AngloSaxonFemale::NAMES.map do |variants| {nameset: ns2b1, variants: variants, position: 3,} end
  )
  ns2b2 = Nameset.create!(label: "Frankish female", subgroup: g2b)
  Name.create!(
    FrankishFemale::NAMES.map do |variants| {nameset: ns2b2, variants: variants, position: 2,} end
  )
  ns2b3 = Nameset.create!(label: "Gothic female", subgroup: g2b)
  Name.create!(
    GothicFemale::NAMES.map do |variants| {nameset: ns2b3, variants: variants, position: 1,} end
  )
  ns2b4 = Nameset.create!(label: "Norse female", subgroup: g2b)
  Name.create!(
    NorseFemale::NAMES.map do |variants| {nameset: ns2b4, variants: variants, position: 4,} end
  )
  
  g3 = Group.create!(label: "Other traditional names")
  
  g3a = Subgroup.create!(group: g3)
  ns3a1 = Nameset.create!(label: "Finnish male", subgroup: g3a)
  Name.create!(
    FinnishMale::NAMES.map do |variants| {nameset: ns3a1, variants: variants, position: 1,} end
  )
  ns3a2 = Nameset.create!(label: "Japanese male", subgroup: g3a)
  Name.create!(
    JapaneseMale::NAMES.map do |variants| {nameset: ns3a2, variants: variants, position: 2,} end
  )
  ns3a3 = Nameset.create!(label: "Indian male", subgroup: g3a)
  Name.create!(
    IndianMale::NAMES.map do |variants| {nameset: ns3a3, variants: variants, position: 3,} end
  )
  
  g3b = Subgroup.create!(group: g3)
  ns3b1 = Nameset.create!(label: "Finnish female", subgroup: g3b)
  Name.create!(
    FinnishFemale::NAMES.map do |variants| {nameset: ns3b1, variants: variants, position: 3,} end
  )
  ns3b2 = Nameset.create!(label: "Japanese female", subgroup: g3b)
  Name.create!(
    JapaneseFemale::NAMES.map do |variants| {nameset: ns3b2, variants: variants, position: 2,} end
  )
  ns3b3 = Nameset.create!(label: "Indian female", subgroup: g3b)
  Name.create!(
    IndianFemale::NAMES.map do |variants| {nameset: ns3b3, variants: variants, position: 1,} end
  )
  
  g4 = Group.create!(label: "Myths")
  
  g4a = Subgroup.create!(group: g4)
  ns4a1 = Nameset.create!(label: "Angels in Judaism and Christianity", subgroup: g4a)
  Name.create!(
    AngelsInJudaismAndChristianity::NAMES.map do |variants| {nameset: ns4a1, variants: variants, position: 1,} end
  )
  ns4a2 = Nameset.create!(label: "Demons", subgroup: g4a)
  Name.create!(
    Demons::NAMES.map do |variants| {nameset: ns4a2, variants: variants, position: 2,} end
  )
  ns4a3 = Nameset.create!(label: "Greek mythology male", subgroup: g4a)
  Name.create!(
    GreekMythologyMale::NAMES.map do |variants| {nameset: ns4a3, variants: variants, position: 3,} end
  )
  
  g4b = Subgroup.create!(group: g4)
  ns4b1 = Nameset.create!(label: "Angels in Islam", subgroup: g4b)
  Name.create!(
    AngelsInIslam::NAMES.map do |variants| {nameset: ns4b1, variants: variants, position: 1,} end
  )
  ns4b2 = Nameset.create!(label: "Greek mythology female", subgroup: g4b)
  Name.create!(
    GreekMythologyFemale::NAMES.map do |variants| {nameset: ns4b2, variants: variants, position: 2,} end
  )
  
  g5 = Group.create!(label: "Geographical names")
  
  g5a = Subgroup.create!(group: g5)
  ns5a1 = Nameset.create!(label: "Countries", subgroup: g5a)
  Name.create!(
    Countries::NAMES.map do |variants| {nameset: ns5a1, variants: variants, position: 1,} end
  )
  g5b = Subgroup.create!(group: g5)
  ns5b1 = Nameset.create!(label: "Middle-earth regions", subgroup: g5b)
  Name.create!(
    MiddleEarthRegions::NAMES.map do |variants| {nameset: ns5b1, variants: variants, position: 1,} end
  )
  
  g6 = Group.create!(label: "Dictionary words")
  
  g6a = Subgroup.create!(group: g6)
  ns6a1 = Nameset.create!(label: "Ancient Greek philosophical concepts", subgroup: g6a)
  Name.create!(
    AncientGreekPhilosophicalConcepts::NAMES.map do |variants| {nameset: ns6a1, variants: variants, position: 1,} end
  )
  
  g7 = Group.create!(label: "Custom 1", custom: true)
  
  g7a = Subgroup.create!(group: g7)
  ns7a1 = Nameset.create!(label: "Type some names here", subgroup: g7a)
  Name.create!(nameset: ns7a1, variants: "Some")
  Name.create!(nameset: ns7a1, variants: "Example")
  Name.create!(nameset: ns7a1, variants: "Words")
  
  g8 = Group.create!(label: "Custom 2", custom: true)
  
  g8a = Subgroup.create!(group: g8)
  ns8a1 = Nameset.create!(label: "Type some names here", subgroup: g8a)
  Name.create!(nameset: ns8a1, variants: "Another")
  Name.create!(nameset: ns8a1, variants: "Custom")
  Name.create!(nameset: ns8a1, variants: "Names")
  
else
  puts "The database is not empty. Nothing was seeded."
end
