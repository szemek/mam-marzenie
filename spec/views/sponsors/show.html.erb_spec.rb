require 'spec_helper'

describe "sponsors/show" do
  before(:each) do
    @sponsor = assign(:sponsor, stub_model(Sponsor,
      :fullname => "",
      :description => "",
      :email => "",
      :phone => "Phone"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Phone/)
  end
end
