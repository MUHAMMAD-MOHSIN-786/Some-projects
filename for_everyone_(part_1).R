folder_path = "./goldsmith_project/pokemon_data-2/"         # just set your own path
new_folder_path = "./goldsmith_project/for_everyone_part1"

# following command will extend the folder_path with the file name
file_path = paste0(folder_path,"pokemon_copy.csv")        
file_path

# for "Type1"
# let's read csv file
data_file = read.csv(file_path)
head(data_file)                     # will show the file as a data-frame
unique(data_file$Type1)             # will show all Type1 rows rather by removing its duplicates

# the following command will throw just those rows of the data in which "Type1" 
# equals to just "Fire" in the "Fires"
Fires = subset(data_file, Type1 == 'Fire')    
Fires

# to make a separate csv file dedicated to "Fires" data set
# path to the new file is
new_file = paste0(new_folder_path, "Fires_(Type1).csv")  # will set the path to the "new_file" variable

# the following command will write all the data to the dedicated file
write.csv(Fires, file = new_file)

# we just want to see the new_file
read.csv(new_file)

                    ########## Type_1 ##########
# for type2 
data_file = read.csv(file_path)
head(data_file)
unique(data_file$Type2)

# the following command will throw just those rows of the data in which "Type2" 
# equals to just "Flying"
Flyings = subset(data_file, Type2 == 'Flying')
Flyings

# to make the separate csv file dedicated to "Flying" data sets
new_file = paste0(new_folder_path, "Flyings_(Type2).csv")
write.csv(Flyings, file = new_file)
read.csv(new_file)

                    ########## COMBINATION_OF_TYPE1_AND_TYPE2##########
# the following commands will get the combination of "Type1" and "Type2" 
fire = subset(data_file, Type1 == "Fire")
fire_flying = subset(fire, Type2 == "Flying")
fire_flying
new_file = paste0(new_folder_path, "fire_flying_(Type1_and_Type2).csv")
write.csv(fire_flying, file = new_file)
read.csv(new_file)                    # we just want to see the new_file


                    ########## IMAGE_MOVEMENT ##########
# First we create a vector with the image names
images = fire_flying$Name
images
# Let's create the folder they need to go to
fire_flyings_directory = paste0(new_folder_path, "Fire_Flyings")  
dir.create(fire_flyings_directory)

# We loop through our images to move them
for (image in images) {
  old_file = paste0(folder_path, "images/", image, ".png")
  
  # We create a simple condition: First we check whether the .png file exists. 
  if (file.exists(old_file)) {
    file.copy(from = old_file, to = fire_flyings_directory)
    
  } else { # If it doesn't, we rewrite the path to point to a .jpg image
    old_file = paste0(folder_path, "images/", image, ".jpg")
    file.copy(from = old_file, to = fire_flyings_directory)
  }
}
