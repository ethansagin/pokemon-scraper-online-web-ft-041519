class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(id:, name:, type:)

  end

  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    db.execute("SELECT * FROM Pokemon WHERE id = ?", id).map do |row|
      Pokemon.new(id: row[0], row[1], row[2])
    
  end
end
