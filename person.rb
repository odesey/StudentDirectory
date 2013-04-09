require 'sqlite3'
require 'pry'
class Person
  # attr_accessor :id
  attr_accessor :type
  attr_accessor :name
  attr_accessor :email
  attr_accessor :iq
  attr_accessor :reason

    
  # Get a reference to the database (HINT - don't need to change this)
  #open up the database to add the new student
  def self.open_database(name)
    @@db = SQLite3::Database.new("student_directory.db")
  end

  # Close the database (HINT - don't need to change this)
  #we close the DB once we've written the new person to the DB
  def self.close_database
    @@db.close
  end

  # Only used for the tests, don't need to call, you can just use @@db
  def self.db
    @@db
  end

#we use the someone data we used to create a new person to populate our new entry in the database, syntax is EXTREMELY important!!!!!!!!!
  def self.save(someone)
       sql = "insert into people (type, name, email, reason_for_joining, iq) values (?, ?, ?, ?, ?)"
       @@db = SQLite3::Database.new("student_directory.db")
       @@db.execute(sql, "#{someone[1]}", "#{someone[2]}", "#{someone[3]}", "#{someone[4]}", "#{someone[5]}")
  end

#code execution resumes here from student_directory.rb, we will create a new student with the following code
  def initialize(someone)
      # we dont need the "id" field, sql will auto increment our DB entries
      # self.id = someone[0].to_i
      #taking the data from "someone(the argument above)" we will map the data from the someone array to the attibutes of the person we are creating
      self.type = someone[1]
      self.name = someone[2]
      self.email = someone[3]
      self.reason = someone[4]
      self.iq = someone[5].to_i
      #once we have our new person speced out, we will save them to the database
      #this a variable to pass the database name to the save method
      my_db = "student_directory.db"
      #before saving we must open the database, code execution moves to line 14
      Person.open_database(my_db)
      Person.save(someone)
      Person.close_database
    end
  
  end

