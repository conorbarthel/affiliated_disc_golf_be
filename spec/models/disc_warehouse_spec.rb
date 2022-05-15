require 'rails_helper'

RSpec.describe DiscWarehouse, type: :model do
  describe 'relationships' do
    it {should belong_to :disc}
    it {should belong_to :warehouse}
  end
end
