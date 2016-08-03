require 'faker'

class Project

  attr_reader :name, :identifier, :version_name


  def initialize
    @name = Faker::Lorem.sentence(3)
    @version_name = Faker::Lorem.sentence(3)
    @identifier = 'tanya' + rand(99999).to_s

  end

end
