require 'spec_helper'

describe Feedback do

  it { should belong_to :post }
  it { should belong_to :user }
  it { should validate_presence_of :comment }
end
