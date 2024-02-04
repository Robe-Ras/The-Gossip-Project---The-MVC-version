require 'bundler'
Bundler.require

require 'csv'

class Gossip
  attr_reader :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  
  def save
    csv_path = File.join(__dir__, '../db/gossip.csv')
    CSV.open(csv_path, "a") do |csv|  
      csv << [author, content]
    end
  end


  def self.all
    # 1)création d'un array vide qui s'appelle all_gossips
    all_gossips = []
  
    CSV.foreach('../db/gossip.csv') do |row|
      # 2-a) Création d'un objet Gossip avec les paramètres de la ligne
      gossip_provisoire = Gossip.new(row[0], row[1])
  
      # 2-b) Permet de rajouter le gossip provisoire au array
      all_gossips << gossip_provisoire
    end
  
    # 3) On renvoie le résultat
    all_gossips
  end


  def self.destroy(index)
    #méthode alternative de celle de (slef.all avec row[0], row[1] )
    all_gossips = []
    CSV.foreach('../db/gossip.csv') do |row|
      author, content = row
      all_gossips << Gossip.new(author, content)
    end

    removed_gossip = all_gossips.delete_at(index)

    CSV.open('../db/gossip.csv', 'w') do |csv|
      all_gossips.each do |gossip|
        csv << [gossip.author, gossip.content]
      end
    end

    removed_gossip
  end

end
