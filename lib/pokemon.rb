require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(id:, name:, type:, db:)

  end

  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    poke = db.execute("SELECT * FROM Pokemon WHERE id = ?", id).flatten
    name = poke[1]
    type = poke[2]
    new_inst = self.new(id: id, name: name, type: type, db: db)
    binding.pry
    new_inst
  end
end
