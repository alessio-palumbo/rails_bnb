require 'rails_helper'

RSpec.describe "profiles/new", type: :view do
  before(:each) do
    assign(:profile, Profile.new(
      :username => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :mobile_number => "MyString",
      :user => nil
    ))
  end

  it "renders new profile form" do
    render

    assert_select "form[action=?][method=?]", profiles_path, "post" do

      assert_select "input[name=?]", "profile[username]"

      assert_select "input[name=?]", "profile[first_name]"

      assert_select "input[name=?]", "profile[last_name]"

      assert_select "input[name=?]", "profile[mobile_number]"

      assert_select "input[name=?]", "profile[user_id]"
    end
  end
end
