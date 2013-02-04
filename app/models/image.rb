class Image < ActiveRecord::Base
  TYPES = %w{ portada farinera events }

  mount_uploader :file, ImageUploader
  validates_presence_of :file
  validates_inclusion_of :kind, :in => TYPES
end
