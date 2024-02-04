require 'bundler'
Bundler.require

require_relative 'controller'

class Router
  # On veut qu'un "Router.new" lancé par app.rb, crée automatique une instance "@controller"
  def initialize
    @controller = Controller.new
  end 
  
  # Rappelle-toi que l'on fait "Router.new.perform" dans app.rb => après initialize, on définit donc perform.
  def perform 
    puts "BIENVENUE DANS THE GOSSIP PROJECT"
  
    while true
      # On affiche le menu
      puts ""
      puts "Tu veux faire quoi jeune mouss' ?"
      puts ""
      puts "1. Je veux créer un gossip"
      puts ""
      puts "2. Je veux afficher tous les gossips"
      puts ""
      puts "3. Je veux supprimer un gossip"
      puts ""
      puts "4. Je veux quitter l'app"
      puts ""
      params = gets.chomp.to_i # On attend le choix de l'utilisateur
  
      case params # En fonction du choix
      when 1
        puts ""
        puts "Tu as choisi de créer un gossip" 
        @controller.create_gossip

      when 2
        puts ""
        puts "Tu as choisis d'afficher tous les gossips"
        @controller.index_gossips
        

      when 3
        puts ""
        puts "Tu as choisi de supprimer un gossip"
        @controller.destroy_gossip
      

      when 4
        puts ""
        puts "À bientôt !"
        break # Ce "break" permet de sortir de la boucle while. C'est même la seule façon d'en sortir.
  
      else
        puts ""
        puts "Ce choix n'existe pas, merci de ressayer" # Si l'utilisateur saisit une entrée non prévue, il retourne au début du "while true". 
        # C'est pour ça que la boucle est infinie: potentiellement, il peut se gourer jusqu'à la fin des temps :)
      end
    end
  end
end

Router.new.perform

