require 'spec_helper'

describe "dreams/new" do
  before(:each) do
    assign(:dream, stub_model(Dream,
      :title => "MyString",
      :description => "MyString",
      :child_fullname => "MyString",
      :child_age => 1,
      :region => "MyString",
      :category => "MyString",
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new dream form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dreams_path, "post" do
      assert_select "input#dream_title[name=?]", "dream[title]"
      assert_select "input#dream_description[name=?]", "dream[description]"
      assert_select "input#dream_child_fullname[name=?]", "dream[child_fullname]"
      assert_select "input#dream_child_age[name=?]", "dream[child_age]"
      assert_select "input#dream_region[name=?]", "dream[region]"
      assert_select "input#dream_category[name=?]", "dream[category]"
      assert_select "input#dream_status[name=?]", "dream[status]"
    end
  end
end
