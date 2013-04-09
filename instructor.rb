class Instructor < Person
  attr_accessor :iq

  # Prompt the user for questions, including those extra quetions pertaining to 
  # Instructor objects
  #
  def ask_questions
    super
    print "What is your IQ? "
    self.iq = gets.strip.chomp
  end

  # Provides a String that represents this Student, try me with puts!
  #
  def to_s
    "ID: #{self.id}
    Type: #{self.class}
    Name: #{self.name}
    Email: #{self.email}
    IQ: #{self.iq}"
  end

  # TODO - Persists this Instructor object to the database
  #
  def save
    # Build a String of SQL, that will insert all the attributes into the persons table

    # Execute the SQL on the @@db object    
  end
end