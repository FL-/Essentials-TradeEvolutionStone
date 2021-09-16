#===============================================================================
# * Trade Evolution Stone - by FL (Credits will be apreciated)
#===============================================================================
#
# This script is for Pokémon Essentials. It makes an item who trigger trade
# evolutions. Trade evolutions with hold item (like Onix to Steelix) only works
# while holding the correct item (Metal Coat).
#
#===============================================================================
#
# To this script works, put it above main OR convert into a plugin. Add into
# PBS\items.txt:
#
# 901,LINKSTONE,Link Stone,1,2100,"A peculiar stone that makes certain species of Pokémon evolve. It has a link cable pattern.",1,0,0,
#
# You can change the fields except the last number. If you change the internal
# name, change also in the script.
#
#===============================================================================

ItemHandlers::UseOnPokemon.add(:LINKSTONE,proc{|item,pokemon,scene|
   if (pokemon.isShadow? rescue false)
     scene.pbDisplay(_INTL("It won't have any effect."))
     next false
   end
   newspecies=pbTradeCheckEvolution(pokemon,item)
   if newspecies<=0
     scene.pbDisplay(_INTL("It won't have any effect."))
     next false
   else
     pbFadeOutInWithMusic(99999){
        evo=PokemonEvolutionScene.new
        evo.pbStartScreen(pokemon,newspecies)
        evo.pbEvolution(false)
       evo.pbEndScreen
        scene.pbRefresh
     }
     next true
   end
})