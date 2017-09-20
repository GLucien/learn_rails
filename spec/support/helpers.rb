module Helpers
  def create_user
    User.create(username: "test")
  end
end