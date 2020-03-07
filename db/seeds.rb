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


  def insert_names(names_module, label, subgroup, position)
    time = Time.now 
    nameset = Nameset.create!(label: label, subgroup: subgroup)
    names = names_module::NAMES.map do |variants|
      {nameset_id: nameset.id, variants: variants, position: position, created_at: time, updated_at: time }
    end
    chunks = names.each_slice(300).to_a
    chunks.each do |chunk|
      Name.insert_all(chunk)
    end
  end
  

  g1 = Group.create!(label: "Traditional Celtic names")  
  g1a = Subgroup.create!(group: g1)
  insert_names(ScottishMale, "Scottish male", g1a, 1)
  insert_names(IrishMale, "Irish male", g1a, 2)
  insert_names(WelshMale, "Welsh male", g1a, 3)
  g1b = Subgroup.create!(group: g1)
  insert_names(ScottishFemale, "Scottish female", g1b, 3)
  insert_names(IrishFemale, "Irish female", g1b, 2)
  insert_names(WelshFemale, "Welsh female", g1b, 1)
 
  g2 = Group.create!(label: "Traditional Germanic names")
  g2a = Subgroup.create!(group: g2)
  insert_names(AngloSaxonMale, "Anglo-Saxon male", g2a, 1)
  insert_names(FrankishMale, "Frankish male", g2a, 2)
  insert_names(GothicMale, "Gothic male", g2a, 3)
  insert_names(NorseMale, "Norse male", g2a, 4)
  g2b = Subgroup.create!(group: g2)
  insert_names(AngloSaxonFemale, "Anglo-Saxon female", g2b, 3)
  insert_names(FrankishFemale, "Frankish female", g2b, 2)
  insert_names(GothicFemale, "Gothic female", g2b, 1)
  insert_names(NorseFemale, "Norse female", g2b, 4)

  g3 = Group.create!(label: "Other traditional names")
  g3a = Subgroup.create!(group: g3)
  insert_names(FinnishMale, "Finnish male", g3a, 1)
  insert_names(JapaneseMale, "Japanese male", g3a, 2)
  insert_names(IndianMale, "Indian male", g3a, 3)

  g3b = Subgroup.create!(group: g3)
  insert_names(FinnishFemale, "Finnish female", g3b, 1)
  insert_names(JapaneseFemale, "Japanese female", g3b, 2)
  insert_names(IndianFemale, "Indian female", g3b, 3)

  g4 = Group.create!(label: "Myths")
  g4a = Subgroup.create!(group: g4)
  insert_names(AngelsInJudaismAndChristianity, "Angels in Judaism and Christianity", g4a, 1)
  insert_names(Demons, "Demons", g4a, 2)
  insert_names(GreekMythologyMale, "Greek mythology male", g4a, 3)
  g4b = Subgroup.create!(group: g4)
  insert_names(AngelsInIslam, "Angels in Islam", g4b, 1)
  insert_names(GreekMythologyFemale, "Greek mythology female", g4b, 2)
  
  g5 = Group.create!(label: "Geographical names")
  g5a = Subgroup.create!(group: g5)
  insert_names(Countries, "Countries", g5a, 1)
  g5b = Subgroup.create!(group: g5)
  insert_names(MiddleEarthRegions, "Middle-earth regions", g5b, 1)
  
  g6 = Group.create!(label: "Dictionary words")
  g6a = Subgroup.create!(group: g6)
  insert_names(AncientGreekPhilosophicalConcepts, "Ancient Greek philosophical concepts", g6a, 1)
  
else
  puts "The database is not empty. Nothing was seeded."
end
