require 'spec_helper'

RSpec.describe 'api/v1/antipode' do
  def app; Sinatra::Application end

  it 'works' do
    get 'api/v1/antipode?loc=hongkong'

    binding.pry
  end
end
