require 'spec_helper'

describe Sponsor do
  subject { Sponsor }
  let :sponsor do
    create(:sponsor)
  end

  it { expect(sponsor).to be_valid }
  it { expect(subject.new).to_not be_valid }
end
