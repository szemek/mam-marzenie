require 'spec_helper'

describe 'sponsors/index' do
  before(:each) do
    assign(:sponsors, [
      stub_model(Sponsor,
                 fullname: 'qwe',
                 description: '',
                 email: 'Coca-Cola@cocacola.com',
                 phone: ''
      ),
      stub_model(Sponsor,
                 fullname: 'Foos',
                 description: '',
                 email: 'Foos@Ro.Dah',
                 phone: '123456789'
      )
    ])
  end

  xit 'renders a list of sponsors' do
    render
    assert_select 'tr>td', text: 'Fullname'.to_s, count: 2
    # assert_select 'tr>td', text: ''.to_s, count: 2
    # assert_select 'tr>td', text: ''.to_s, count: 2
    # assert_select 'tr>td', text: 'Phone'.to_s, count: 2
  end
end
