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
    hp = poke[3]
    new_inst = self.new(id: id, name: name, type: type, db: db, hp: hp)
    new_inst
  end
  
  def alter_hp(num, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", [num], [self.id])
    self.hp = num
  end
end
