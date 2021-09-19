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
# 901,LINKSTONE,Link Stone,Link Stones,1,3000,"A peculiar stone that makes certain species of Pokémon evolve. It has a link cable pattern.",1,0,7,
#
# You can change the fields except the last number. If you change the internal
# name, change also in the script.
#
#===============================================================================

if defined?(PluginManager) && !PluginManager.installed?("Trade Evolution Stone")
  PluginManager.register({                                                 
    :name    => "Trade Evolution Stone",                                        
    :version => "1.0.3",                                                     
    :link    => "https://www.pokecommunity.com/showthread.php?t=458757",             
    :credits => "FL"
  })
end

alias :_old_fl_pbCheckEvolution :pbCheckEvolution
def pbCheckEvolution(pokemon,item=0)
  return pbTradeCheckEvolution(pokemon,pokemon) if item==PBItems::LINKSTONE
  return _old_fl_pbCheckEvolution(pokemon,item)
end