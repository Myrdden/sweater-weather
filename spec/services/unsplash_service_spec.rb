require 'spec_helper'

RSpec.describe UnsplashService do
  it 'Background Image' do
    image = UnsplashService.get_background('denver,co')
    expect(image).to be_a(String)
    # I dunno
  end
end
