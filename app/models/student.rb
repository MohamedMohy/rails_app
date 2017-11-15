class Student < ApplicationRecord    
  def self.authenticate(username, password)
    user = find_by_USERNAME(username)
    if user && user.PASSWORD == password
        user
    else
        nil
    end
  end
end