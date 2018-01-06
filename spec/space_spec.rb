require_relative '../lib/item_classes/space_class.rb'

RSpec.describe 'Space' do
  before do
    @descrption = "Une très longue\
 description, qui dure si longtemps qu'on en finit par oublier à quoi\
 ressemble le début, tant et si bien qu'on a envie de partir..."
    @space = Space.new(name: "Salle d'armes",
                       description: @description,
                       group: "Château")
  end

  it "has a name" do
    expect(@space.name).to eq("Salle d'armes")
  end

  it "has a description" do
    expect(@space.description).to eq(@description)
  end

  it "belongs to a group of spaces" do
    expect(@space.group).to eq("Château")
  end
end
