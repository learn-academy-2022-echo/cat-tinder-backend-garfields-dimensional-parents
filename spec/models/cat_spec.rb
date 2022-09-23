require 'rails_helper'

RSpec.describe Cat, type: :model do
  cat = Cat.create
  it 'should validate that the name exists in the database entry' do
    cat = Cat.create(age: 2, enjoys: 'playing', image: 'https://thiscatdoesnotexist.com/')
    expect(cat.errors[:name]).to_not be_empty
  end
  it 'should validate that the age exists in the database entry' do
    cat = Cat.create(name:'Garfield' , enjoys: 'playing', image: 'https://thiscatdoesnotexist.com/')
    expect(cat.errors[:age]).to_not be_empty
  end
  it 'should validate that the enjoys exists in the database entry' do
    cat = Cat.create
    expect(cat.errors[:enjoys]).to_not be_empty
  end
  it 'should validate that the image exists in the database entry' do
    cat = Cat.create
    expect(cat.errors[:image]).to_not be_empty
  end
  it 'should validate that the enjoys is 10 characters long minimum in the database entry' do
    cat = Cat.create(name:'Garfield',age: 2, enjoys: 'playing', image: 'https://thiscatdoesnotexist.com/')

    expect(cat.errors[:enjoys]).to_not be_empty
  end
end
