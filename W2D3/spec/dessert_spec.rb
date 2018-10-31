require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:brownie) { Dessert.new("brownie", 10, chef) }
  let(:chef) { double("chef", name: "Bob") }

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("brownie")
    end

    it "sets a quantity"do
      expect(brownie.quantity).to be_a(Integer)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to be_empty
    end
    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("brownie", "five", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(brownie.add_ingredient("sugar")).to include("sugar")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ['sugar', 'flour', 'cocoa powder']

      brownie.add_ingredient('sugar')
      brownie.add_ingredient('flour')
      brownie.add_ingredient('cocoa powder')
      expect(brownie.ingredients).to eq(ingredients)
      brownie.mix!
      expect(brownie.ingredients.sort).to eq(ingredients.sort)
      expect(brownie.ingredients).to_not eq(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(brownie.eat(5)).to eq(5)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { brownie.eat(20) }.to raise_error('not enough left!')
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Bob the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end
  end
end
