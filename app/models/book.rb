# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  cover       :string
#  description :text
#  name        :string
#  slug        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
# Indexes
#
#  index_books_on_slug  (slug) UNIQUE
#

class Book < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  mount_uploader :cover, CoverUploader
  belongs_to :user
=begin
  attr_accessor :cover

  after_save :save_cover_image, if: :cover

  def save_cover_image
    filename = cover.original_filename
    folder = "public/books/#{id}/cover"
    FileUtils::mkdir_p folder
    f = File.open File.join(folder, filename), "wb"
    f.write cover.read()
    f.close
    self.cover = nil
    update cover_filename: filename
  end
=end
end
