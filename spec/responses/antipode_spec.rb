require 'spec_helper'

RSpec.describe 'api/v1/antipode' do
  get 'api/v1/antipode?loc=hongkong'

  binding.pry
end
