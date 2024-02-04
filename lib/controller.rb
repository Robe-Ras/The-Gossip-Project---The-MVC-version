require 'bundler'
Bundler.require

require_relative 'view'
require_relative 'gossip'


class Controller

  def initialize
    @view = View.new
  end

  
  def create_gossip

    params = @view.create_gossip

    gossip = Gossip.new(params[:author], params[:content])
    gossip.save

  end


  def index_gossips
    gossips = Gossip.all
    @view.index_gossips(gossips)
  end


  def destroy_gossip
    @view.index_gossips(Gossip.all)

    puts "Quel gossip veux-tu supprimer ?"
    index_to_destroy = gets.chomp.to_i - 1

    if index_to_destroy >= 0 && index_to_destroy < Gossip.all.length
      removed_gossip = Gossip.destroy(index_to_destroy)

      puts "Le gossip '#{removed_gossip.content}' de '#{removed_gossip.author}' a été supprimé avec succès!"

    else
      puts "Numéro de gossip invalide. Aucun gossip n'a été supprimé !"
    end
    
  end

end



