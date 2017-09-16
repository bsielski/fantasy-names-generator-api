require 'rails_helper'

RSpec.describe "Group API", type: :request do

  before :context do
    g1 = Group.create!(label: "Traditional Celtic names")
    g1a = Subgroup.create!(group: g1)
    n1a1 = Nameset.create!(label: "Scottish male", subgroup: g1a)
    Name.create!(nameset: n1a1, variants: "Boisil")
    Name.create!(nameset: n1a1, variants: "Feargan")
    Name.create!(nameset: n1a1, variants: "Taran")
    n1a2 = Nameset.create!(label: "Scottish female", subgroup: g1a)
    Name.create!(nameset: n1a2, variants: "Brianag")
    Name.create!(nameset: n1a2, variants: "Fionnghuala")
    Name.create!(nameset: n1a2, variants: "Muireall")
    g1b = Subgroup.create!(group: g1)
    n1a1 = Nameset.create!(label: "Irish male", subgroup: g1b)
    n1a2 = Nameset.create!(label: "Irish female", subgroup: g1b)

    g2 = Group.create!(label: "Traditional Germanic names")
    g2a = Subgroup.create!(group: g2)
    ns2a1 = Nameset.create!(label: "Frankish male", subgroup: g2a)
    Name.create!(nameset: ns2a1, variants: "Einhard")
    Name.create!(nameset: ns2a1, variants: "Nordbert")
    ns2a2 = Nameset.create!(label: "Frankish female", subgroup: g2a)
    # no names
    # no names
    g2b = Subgroup.create!(group: g2)
    ns2b1 = Nameset.create!(label: "Gothic male", subgroup: g2b)
    Name.create!(nameset: ns2b1, variants: "Ermanaric")
    Name.create!(nameset: ns2b1, variants: "Totila")
    ns2b2 = Nameset.create!(label: "Gothic female", subgroup: g2b)
    Name.create!(nameset: ns2b2, variants: "Helchen")
    Name.create!(nameset: ns2b2, variants: "Sunigilda")
    g2c = Subgroup.create!(group: g2)
    ns2c1 = Nameset.create!(label: "Norse male", subgroup: g2c)
    Name.create!(nameset: ns2c1, variants: "Lodin")
    Name.create!(nameset: ns2c1, variants: "Urm")
    ns2c2 = Nameset.create!(label: "Norse female", subgroup: g2c)
    Name.create!(nameset: ns2c2, variants: "Asa")
    Name.create!(nameset: ns2c2, variants: "Gunnhild")

    g3 = Group.create!(label: "Other traditional names")

  end

  after :context do
    Name.destroy_all
    Nameset.destroy_all
    Subgroup.destroy_all
    Group.destroy_all
  end

  describe 'GET /groups' do
    before { get '/groups' }
    it 'returns 2 not empty objects' do
      expect(JSON.parse(response.body).size).to eq(2)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
    it 'returns json response type' do
      expect(response.content_type).to eq("application/json")
    end
  end

  describe 'GET /groups with_empties=true' do
    before { get '/groups', params: {with_empties: true} }
    it 'returns all 3 objects' do
      expect(JSON.parse(response.body).size).to eq(3)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
    it 'returns json response type' do
      expect(response.content_type).to eq("application/json")
    end
  end

  describe 'GET /groups with_empties=false' do
    before { get '/groups', params: {with_empties: false} }
    it 'returns 2 not empty objects' do
      expect(JSON.parse(response.body).size).to eq(2)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
    it 'returns json response type' do
      expect(response.content_type).to eq("application/json")
    end
  end


end
