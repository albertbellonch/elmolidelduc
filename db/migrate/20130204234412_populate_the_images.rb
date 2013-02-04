class PopulateTheImages < ActiveRecord::Migration
  def self.up
    Image.delete_all

    info = {
      'portada' => %w{ portada_1 },
      'farinera' => %w{ farinera_1 farinera_2 farinera_3 farinera_4 farinera_5 },
      'events' => %w{ graner_1 graner_2 graner_3 graner_4 graner_5 graner_6 sala_1 sala_2 jardi_1 jardi_2 jardi_3 jardi_4 jardi_5 cuina_1 cuina_2 cuina_3 cuina_4 }
    }

    info.each do |kind, images|
      images.each do |image|
        path = Rails.root.join("public/images/pics/#{image}.jpg").to_s
        Image.create(:file => File.open(path), :kind => kind)
      end
    end
  end

  def self.down
  end
end
