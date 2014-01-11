require 'spec_helper'

describe Post do
  it { should validate_presence_of :name }
  it { should validate_presence_of :url }
  it { should have_many :feedbacks }
  it { should belong_to :user }
end
