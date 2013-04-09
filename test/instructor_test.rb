require 'test/unit'
require 'sqlite3'
require 'pry'
require_relative '../person'
require_relative '../student'
require_relative '../instructor'

class InstructorTest < Test::Unit::TestCase

  def setup
    Person.open_database "test/test.db"
  end

  def test_that_the_save_method_works
    begin
      Person.db.transaction
      instructor = Instructor.new
      instructor.name = "Tisha"
      instructor.email = "tisha@gmail.com"
      instructor.iq = 400
      instructor.save

      # If it worked, we should have one record in the people database called Susan
      results = Person.db.execute("select * from people where name = 'Tisha'")
      assert_not_nil results
      assert_equal 1, results.length

    rescue
      raise
    ensure
      Person.db.rollback
    end
  end

  def teardown
    Person.close_database
  end

end