
# Preamble ----------------------------------------------------------------


  #Remove Latent Variables (except for the preamble trigger)
  rm(list = setdiff(ls(), "load.pac.switch"))
  
  #Test and install pacman package
  if (require('pacman')) {
    library('pacman')
  } else{
    install.packages('pacman')
    library('pacman')
  }
  
  #Use Pacman to install other useful packages
#  pacman::p_load(ggplot2, rmarkdown, plotly, rstudioapi, reshape2, plot.matrix)
  
  
  #Use the Rstudio API to get the working directory
  current_path <- getActiveDocumentContext()$path
  
  # Test if the document is saved and it's not an rmd
  if (length(current_path) > 1 && !grepl(".rmd", current_path)) {
    setwd(dirname(current_path)) # change the working directory to the curret folder
    print(getwd()) #Print what that working directory is
  } else if(length(current_path) > 1) {
    print(# if the file path is way to short tell the user to save the file
      "Could not set working directory to current directory, perhaps save the script or if in RMD disregard"
    )
  }
  
  #  updateR() #Uncomment if you want to update R
  


# Constants ---------------------------------------------------------------
n <- 8
m <- 16

# Generate Colours --------------------------------------------------------

## https://stackoverflow.com/questions/15282580/how-to-generate-a-number-of-most-distinctive-colors-in-r

library(RColorBrewer)
qual_col_pals = brewer.pal.info[brewer.pal.info$category == 'qual',]
col_vector = unlist(mapply(brewer.pal, qual_col_pals$maxcolors, rownames(qual_col_pals)))
pie(rep(1,m), col=sample(col_vector, m))



# Build a Matrix ----------------------------------------------------------

mat <- matrix(0, nrow = 2^n+1, ncol = 2^n+1)
mat <- matrix(runif((2^n+1)^2, min = 1, max = 16), nrow = 2^n+1, ncol = 2^n+1)
mat[1,] <- 0
mat[2^n+1,] <- 0
mat[,1] <- 0
mat[,2^n+1] <- 0


# generate matrix plot ----------------------------------------------------


dim(mat)

make_matrix_plot <- function (mat) {
#  mat <- make_walls_dead(mat)
  par(pty = "s", mai = c(0.1, 0.1, 0.4, 0.1))
  image(rotate(mat), col = col_vector,
        axes = FALSE,
        frame.plot = TRUE,
        main = "Persian Rug")
}


rotate <- function(x) {
  t(apply(x, 2, rev))
}


## make_walls_dead <- function(mat) {
##   mat[mat==9] <- 0
##   return(mat)
## }



make_matrix_plot(mat)




