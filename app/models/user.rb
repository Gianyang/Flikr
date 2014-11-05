class User < ActiveRecord::Base
  has_many :albums
  
  after_create :create_an_album
  private
  
  def create_an_album
    self.albums.create(name: "#{self.username}'s adventure")
  end

  def self.authenticate(username, password)
    account = self.where(username: username)
    if account.count != 0
      if account[0].password == password
        return account[0]
      end
    end
  end
end