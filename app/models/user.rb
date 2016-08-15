class User < ActiveRecord::Base
  attr_accessor :friends
  @friends = []

  has_secure_password
  has_many :todos
end