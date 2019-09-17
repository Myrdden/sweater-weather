require 'spec_helper'

RSpec.describe UnsplashService do
  it 'Background Image' do
    image = UnsplashService.get_background('denver,co')
    expected_keys = [:id, :created_at, :updated_at, :width, :height, :color,
                     :description, :alt_description, :urls, :links, :categories,
                     :likes, :liked_by_user, :current_user_collections, :user,
                     :exif, :location, :views, :downloads]
    expect(image.keys).to eq(expected_keys)
  end
end
