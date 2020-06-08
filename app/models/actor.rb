class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    first_name + " " + last_name
  end

  def list_roles
    roles = []
    roles.push(Character.all.where(:actor == self).map{|char| char.name + " - " + char.show.name})
    roles[0]
  end
end