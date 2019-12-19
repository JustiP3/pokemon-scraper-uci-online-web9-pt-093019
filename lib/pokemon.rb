class Pokemon

  attr_accessor :id, :name, :type
  attr_reader :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
    db.execute(sql, name, type)
    self.id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
end
