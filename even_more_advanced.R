data_folder = "/home/muhammad/R_programming/project_omair/goldsmith_project_(copy)/pokemon_data-2/"
#path_for_images = paste0(data_folder,'images/abomasnow.png')
path_to_save_output = '/home/muhammad/R_programming/project_omair/goldsmith_project_(copy)/even_more_advanced/'
path_for_data = paste0(data_folder,'pokemon.csv')
library(magick)
data_file = read.csv(path_for_data)
head(data_file)
images = data_file$Name
images

# let's take the watermark's reading


# Let's add a watermark now
watermark_applied = function(pokemon_image){image_1 = paste0(data_folder, "images_copy/", image , ".png")
pokemon_image = image_read(image_1)
pokemon_image
image_with_watermark = image_annotate(pokemon_image, text = "original_watermark",
                                      gravity = "Center", 
                                      location = "+0+10", # Moving the mark down by 15 pixels from its 'Center' gravity point
                                      size = 20,  
                                      color = "#00000399",
                                      strokecolor = NULL, 
                                      boxcolor = NULL)
image_write(image_with_watermark,
            path = paste0(path_to_save_output,"output/",image,".png"))
}




    
    
  #image_with_watermark
for (image in images)
  #reading_image(pokemon_image)
  watermark_applied(pokemon_image)
  
