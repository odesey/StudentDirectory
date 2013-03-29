
require 'rubygems'
require 'yaml'

class Person
  attr_accessor :name
  attr_accessor :email
  attr_accessor :github_user
  attr_accessor :twitter
  attr_accessor :fun_fact
  attr_accessor :favorite_food
  attr_accessor :age

      def initialize
        self.quetionaire
      end

      def self.create_person(type)
          case type
           when /[Ii]nstructor/
              Instructor.new
           when /[Ss]tudent/
              Student.new
           else
              "Sorry, this form is for Students and Instructors only!"
          end
      end

        def quetionaire
            print "What is your name? "
            self.name = gets.strip.chomp
            print "How old are you #{self.name}? "
            self.age = gets.strip.chomp
            print "What is your email? "
            self.email = gets.strip.chomp
            print "What is your github user ID? "
            self.github_user = gets.strip.chomp
            print "What is your twitter account? "
            self.twitter = gets.strip.chomp
            print "Tell us a fun fact about you: "
            self.fun_fact = gets.strip.chomp
            print "What is your favorite food? "
            self.favorite_food = gets.strip.chomp
        end
end


class Student < Person
  attr_accessor :fun_fact
     def questionaire
      super
      "What is the reason you came to GA?"
      self.fun_fact = gets.strip.chomp
    end
end


class Instructor < Person
  
    def questionaire
      super
      "Seeing that youre an Instructor\n We know youre only here for the MONEY! "
    end
end

@directory = ""
puts "Student Directory, v0.0.1 by Dan Garland"
print "Enter Student or Instructor, q to save and quit: "


while ((input = gets.strip.chomp) != 'q') do

somebody = Person.create_person(input)


 # end   
 
  # Append this to our yaml file
  @directory += somebody.to_yaml
  puts @directory
  
  print "Enter Student or Instructor, q to save and quit: "
end

# Open a student_directory.yml YAML file and write it out on one line
File.open('student_directory.yml', 'a') { |f| f.write(@directory) } 
