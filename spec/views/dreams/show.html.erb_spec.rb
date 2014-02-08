require 'spec_helper'

describe "dreams/show" do
  before(:each) do
    @dream = assign(:dream, stub_model(Dream,
      :title => "Title",
      :description => "Description",
      :child_fullname => "Child Fullname",
      :child_age => 1,
      :region => "Region",
      :category => "Category",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Child Fullname/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Region/)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/Status/)
  end
end
