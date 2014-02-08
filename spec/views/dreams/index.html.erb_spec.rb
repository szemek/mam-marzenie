require 'spec_helper'

describe "dreams/index" do
  before(:each) do
    assign(:dreams, [
      stub_model(Dream,
        :title => "Title",
        :description => "Description",
        :child_fullname => "Child Fullname",
        :child_age => 1,
        :region => "Region",
        :category => "Category",
        :status => "Status"
      ),
      stub_model(Dream,
        :title => "Title",
        :description => "Description",
        :child_fullname => "Child Fullname",
        :child_age => 1,
        :region => "Region",
        :category => "Category",
        :status => "Status"
      )
    ])
  end

  it "renders a list of dreams" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Child Fullname".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Region".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
