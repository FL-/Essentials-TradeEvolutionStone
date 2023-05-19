#===============================================================================
# * Trade Evolution Stone - by FL (Credits will be apreciated)
#===============================================================================
#
# This script is for Pokémon Essentials. An item who trigger trade evolutions.
# Trade evolutions with hold item (like Onix to Steelix) only works while
# holding the correct item (Metal Coat).
#
#== INSTALLATION ===============================================================
#
# To this script works, put it above main OR convert into a plugin. Add into
# PBS\items.txt:
#
# In Essentials version 20 or above:
#
#  [BOOSTERPACK]
#  Name = Link Stone
#  NamePlural = Link Stones
#  Pocket = 1
#  Price = 3000
#  FieldUse = OnPokemon
#  Flags = EvolutionStone,Fling_30
#  Description = A peculiar stone that makes certain species of Pokémon evolve. It has a link cable pattern.
#
# In In v19-v19.1:
#
#  901,LINKSTONE,Link Stone,Link Stones,1,3000,"A peculiar stone that makes certain species of Pokémon evolve. It has a link cable pattern.",1,0,7,
#
# You can change the fields. If you change the internal name, change also in the
# script.
#
#===============================================================================

if !PluginManager.installed?("Trade Evolution Stone")
  PluginManager.register({                                                 
    :name    => "Trade Evolution Stone",                                        
    :version => "1.1.1",                                                     
    :link    => "https://www.pokecommunity.com/showthread.php?t=458757",             
    :credits => "FL"
  })
end

class Pokemon
  alias :_old_fl_check_evolution_on_use_item :check_evolution_on_use_item
  def check_evolution_on_use_item(item_used)
    # self is a placeholder here
    return check_evolution_on_trade(self) if item_used==:LINKSTONE
    return _old_fl_check_evolution_on_use_item(item_used)
  end
end