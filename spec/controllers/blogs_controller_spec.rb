require 'rails_helper'

describe BlogsController do
  # context封装了一个命名空间，给出一个描述，表示当前测试的内容
  context "not logged in" do
    it "should be redirect to login page" do
      get :edit, id: 1
      expect(response).to redirect_to(new_session_path)
    end
  end

  context "logged in" do
    before(:each) do
      @user = create_user
      login_user @user

      @blog = @user.blogs.create(title)
    end
  end
end