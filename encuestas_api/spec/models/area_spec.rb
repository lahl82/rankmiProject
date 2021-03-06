require 'rails_helper'

RSpec.describe Area, type: :model do
  it { should belong_to(:parent) }
  it { should validate_presence_of(:name) }
end
