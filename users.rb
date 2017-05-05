require 'faker'

class Users

  attr_accessor :first_name, :users

  def initialize
    @first_name = Faker::Name.first_name
    @email = Faker::Internet.email(@first_name)
    @password = Faker::Internet.password
  end

  def to_s
    string = "First name: #{@first_name}\n"
    string << "Email: #{@email}\n"
    string << "Password: #{@password}\n"
    string << "--------------------------\n"
    string
  end
end
