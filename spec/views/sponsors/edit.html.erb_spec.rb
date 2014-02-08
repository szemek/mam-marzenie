require 'spec_helper'

describe "sponsors/edit" do
  before(:each) do
    @sponsor = assign(:sponsor, stub_model(Sponsor,
      :fullname => "",
      :description => "",
      :email => "",
      :phone => "MyString"
    ))
  end

  it "renders the edit sponsor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sponsor_path(@sponsor), "post" do
      assert_select "input#sponsor_fullname[name=?]", "sponsor[fullname]"
      assert_select "input#sponsor_description[name=?]", "sponsor[description]"
      assert_select "input#sponsor_email[name=?]", "sponsor[email]"
      assert_select "input#sponsor_phone[name=?]", "sponsor[phone]"
    end
  end
end
