require 'rails_helper'

RSpec.describe "profiles/show", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :username => "Username",
      :first_name => "First Name",
      :last_name => "Last Name",
      :mobile_number => "Mobile Number",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Mobile Number/)
    expect(rendered).to match(//)
  end
end
