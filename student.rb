
require 'rubygems'
require 'yaml'
require 'pry'

class Person
  attr_accessor :name
  attr_accessor :email
  attr_accessor :github_user
  attr_accessor :twitter
  attr_accessor :fun_fact
  attr_accessor :favorite_food
  attr_accessor :age

@directory = []
      def initialize
        self.questionaire
      end


      def self.create_person(type)
          case type
           when /[Ii]nstructor/
              Instructor.new
           when /[Ss]tudent/
              Student.new
            when /[Ll]/
            #     load_students
            # def load_students
          @directory << YAML.load_documents(File.open('student_directory.yml'))
      # end
           else
              "Sorry, this form is for Students and Instructors only!"
          end
      end
# binding.pry
        def questionaire
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
      puts "What is the reason you came to GA?"
      self.fun_fact = gets.strip.chomp
    end
end


class Instructor < Person
  
    def questionaire
      super
      return "Seeing that youre an Instructor\n We know youre only here for the MONEY! "
    end
end

# class Load
  
#     def load_students
#       @directory += YAML.load_documents(File.open('student_directory.yml'))
#     end
# end

@directory = []
puts "Student Directory, v0.0.3 by Dan Garland & Ed"
print "Enter Student or Instructor" 
print "Enter l to load previos students or q to save and quit: "


while ((input = gets.strip.chomp) != 'q') do

somebody = Person.create_person(input)


 # end   
 
  # Append this to our yaml file
  @directory << somebody.to_yaml
  puts @directory
  
  puts "Student Directory, v0.0.3 by Dan Garland & Ed"
  print "Enter Student or Instructor" 
  print "Enter l to load previos students or q to save and quit: "
end

# while input = gets.strip.chomp == 'l' do
#   # File.open('student_directory.yml') { |f| f.read@directory) } 
#   @directory += YAML.load_documents(File.open('student_directory.yml'))

# end
# binding.pry
# Open a student_directory.yml YAML file and write it out on one line
# File.open('student_directory.yml', 'a') { |f| f.write(@directory) } 
# Save people to a YAML file
File.open('student_directory.yml', 'a') { |f|
  @directory.compact.each do |person|
    f.write(person.to_yaml)

  end   
} 
