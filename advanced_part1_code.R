folder_path = "/home/muhammad/R_programming//goldsmith_project/pokemon_data-2/"         # just set your own path "from home"
new_folder_path = "./goldsmith_project/advanced_part1/"

# following command will extend the folder_path with the file name
file_path = paste0(folder_path,"pokemon_copy.csv")        
file_path
data_file = read.csv(file_path)

# we will loop through all "Type1" unique names one after another
for (item in unique(data_file$Type1))
  {data = subset(data_file, data_file$Type1 == item)
new_file = paste0(new_folder_path, item,".csv")
write.csv(data , file = new_file)}

# you can check either giving a random name
new_made_files_path = paste0(new_folder_path,"Flying.csv") # can check any name by changing name
data_file_2 = read.csv(new_made_files_path)
head(data_file_2)
