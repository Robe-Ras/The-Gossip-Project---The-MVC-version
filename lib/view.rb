require 'bundler'
Bundler.require

class View
  def create_gossip
    puts ""
    puts "Entrer votre nom :"
    name = gets.chomp

    puts ""
    puts "Entrez le gossip à partager :"
    gossip = gets.chomp

    # Utilisation du hash pour retourner les valeurs
    return { content: gossip, author: name }
  end

  def index_gossips(gossips)
    gossips.each_with_index do |gossip, index|
      puts "#{index + 1}. #{gossip.author}: #{gossip.content}"
    end
  end

end