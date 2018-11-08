# == Schema Information
#
# Table name: houses
#
#  id         :bigint(8)        not null, primary key
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class House < ApplicationRecord
  has_many :gardeners,
    class_name: 'Gardener',
    foreign_key: :house_id,
    primary_key: :id

  has_many :plants,
    through: :gardeners,
    source: :plants

  def n_plus_one_seeds
    plants = self.plants
    seeds = []
    plants.each do |plant|
      seeds << plant.seeds
    end

    seeds
  end

#includes
  def better_seeds_query
    plants = self.plants.includes(:seeds)
    num_of_seeds = []

    plants.each do |plant|
      num_of_seeds << plants.seeds
    end
    
    num_of_seeds
  end

  #JOINS TABLE

  # def better_seeds_query
  #   plants = self
  #     .plants
  #     .select('plants.*')
  #     .joins(:plants)
  #     .group('plants.id')
  #
  #     num_of_seeds = {}
  #     plants.each do |plant|
  #       num_of_seeds[plant.id] = plants.seeds.count
  #     end
  #
  #     num_of_seeds
  # end
end
