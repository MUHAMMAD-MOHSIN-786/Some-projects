# Let's install a package that will give us functions for image manipulation
# Note: You only need to do this ONCE!
install.packages("magick")
# Let's load it so that we can use it
library(magick)

# First we read in the image that will be the background
image_path = "/project_omair/goldsmith_project/for_everyone_part2/"
pokemon_1_path = '/home/muhammad/R_programming/project_omair/pokemon_data-2/images/gabite.png'
pokemon_2_path = '/home/muhammad/R_programming/project_omair/pokemon_data-2/images/haxorus.png'
loading_path = paste0(image_path,"battle_scene_1.png")
battle_field = image_read(loading_path)

# Let's resize it first. Note that I save this back into the variable 'goldsmiths' so that this change isn't lost!
battle_field = image_scale(battle_field, "x250")
battle_field

# let's load our pokemons which we have to fit in the battle_scene
pokemon_1 = image_read(pokemon_1_path)
pokemon_1 =image_scale(pokemon_1,"200")
pokemon_1
  # similarly, for pokemon 2
pokemon_2 = image_read(pokemon_2_path)
pokemon_2 = image_flop(pokemon_2)
pokemon_2 = image_scale(pokemon_2,'150')
pokemon_2
# let's manipulate our pokemons to get fit in the battle-field

# Then we put the two images together
battle_field_pokemon_1 = image_composite(battle_field, pokemon_1, 
                                      offset = "+220+30")
battle_field_pokemon_1
battle_field_pokemon = image_composite(battle_field_pokemon_1,pokemon_2,offset = "+30+50")
battle_field_pokemon
# Add text
after_text = image_annotate(battle_field_pokemon, " Haxorus Vs Gabite", size = 25, gravity = "south", color = "white")
after_text
# let's save our final image in our specified path
path_to_save = paste0(image_path,'haxorus_Vs_Gabite.png')
image_write(after_text,path_to_save)
