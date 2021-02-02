class Ev
 DB = PG.connect({:host => "localhost", :port => 5432, :dbname => 'ev_project_development'})

 def self.all
    results = DB.exec("SELECT * FROM ev;")
    return results.each do |result|
        {
            "id" => result["id"].to_i,
            "make" => result["make"],
            "body_style" => result["body_style"],
            "model" => result["model"],
            "trim_level" => result["trim_level"],
            "year" => result["year"].to_i,  
        }
    end
end

    def self.find(id)
        results = DB.exec("SELECT * FROM ev WHERE id=#{id};")
        return {
            "id" => results.first["id"].to_i,
            "make" => results.first["make"],
            "body_style" => results.first["body_style"],
            "model" => results.first["model"],
            "trim_level" => results.first["trim_level"],
            "year" => results.first["year"].to_i,
        }
    end

    def self.create(opts)
        results = Db.exec(
            <<-SQL
            INSERT INTO ev (make, body_style, model, trim_level, year)
            VALUES ( '#{opts["make"]}', '#{opts["body_style"]}', '#{opts["model"]}', '#{opts["trim_level"]}', #{opts["year"]} )
            RETURNING id, make, body_style, model, trim_level, year;
            SQL
        )
        return {
            "id" => results.first["id"].to_i,
            "make" => results.first["make"],
            "body_style" => results.first["body_style"],
            "model" => results.first["model"],
            "trim_level" => results.first["trim_level"],
            "year" => results.first["year"].to_i,
        }
    end

    def self.delete(id)
        results = DB.exec("DELETE FROM ev WHERE id=#{id};")
        return { "deleted" => true }
    end

    def self.update(id, opts)
        results = DB.exec(
            <<-SQL
            UPDATE ev
            SET '#{opts["make"]}', '#{opts["body_style"]}', '#{opts["model"]}', '#{opts["trim_level"]}', #{opts["year"]} 
            WHERE id=#{id}
            RETURNING id, make, body_style, model, trim_level, year;
            SQL
        )
        return {
            "id" => results.first["id"].to_i,
            "make" => results.first["make"],
            "body_style" => results.first["body_style"],
            "model" => results.first["model"],
            "trim_level" => results.first["trim_level"],
            "year" => results.first["year"].to_i, 
        }
    end
end
