require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(id:, name:, type:, db:)

  end

  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    poke = db.execute("SELECT * FROM Pokemon WHERE id = ?", id).map do |row|
      Pokemon.new(poke)
      binding.pry
    end
  end
end
