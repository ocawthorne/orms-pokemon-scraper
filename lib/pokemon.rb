class Pokemon
    attr_reader :id
    attr_accessor :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id, @name, @type, @db = id, name, type, db
      end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type) VALUES (?, ?)
        SQL

        db.execute(sql, name, type)
    end

      def self.find(id_num, db)
        pokemon_info = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num)[0]
        self.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
      end
    
end
