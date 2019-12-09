class Song < ActiveRecord::Base
  belongs_to :artist 
  belongs_to :genre 
  has_many :notes
  accepts_nested_attributes_for :notes, :reject_if => proc { |attrs| attrs[:content].blank? }
   
  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end
  
  def artist_name 
    self.try(:artist).try(:name)
  end 
  
  def genre_name=(genre_name)
    self.genre = Genre.find_or_create_by(name: genre_name)
  end 
  
  def genre_name
    self.try(:genre).try(:name)
  end 
end
