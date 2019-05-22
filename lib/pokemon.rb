require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    poke = db.execute("SELECT * FROM Pokemon WHERE id = ?", id).flatten
    name = poke[1]
    type = poke[2]
    hp = 60
    new_inst = self.new(id: id, name: name, type: type, db: db, hp: 60)
    new_inst
  end
end
