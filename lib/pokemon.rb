class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(id:, name:, type:, db:)

  end

  def self.save(name, type, db)
    sql = <<-SQL
      SELECT *
      FROM Pokemon
      WHERE name = ?, type = ?
    SQL
    
    DB[:conn].execute(sql, name, type, db).map do |poke|
      
  
end
