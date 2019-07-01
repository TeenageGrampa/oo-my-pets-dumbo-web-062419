require 'pry'
class Owner
  attr_accessor 
  attr_reader :species, :name
  @@all = []
  


  def initialize(name)
    @name = name
    @species = 'human'
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{@species}."
  end


  def buy_cat(name)
    cat = Cat.new(name, self)
  end

  def cats
    Cat.all.select{|cat| cat.owner == self}
  end

  def buy_dog(name)
    dog = Dog.new(name, self)
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def walk_dogs
    dogs.map{|dog| dog.mood = 'happy'}
  end

  def feed_cats
    cats.map{|cat| cat.mood = "happy"}
  end

  def sell_pets
    cats.map{|cat| cat.mood = 'nervous'}
    cats.map{|cat| cat.owner = nil}
    dogs.map{|dog| dog.mood = 'nervous'}
    dogs.map{|dog| dog.owner = nil}
    cats.clear
    dogs.clear
  end

  def list_pets
    "I have #{dogs.size} dog(s), and #{cats.size} cat(s)."
  end


end
# binding.pry