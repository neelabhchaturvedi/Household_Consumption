

######################################################################
# generate the report, slides, and if needed start the web application

unlink( "TMPdirReport", recursive = TRUE )      
dir.create( "TMPdirReport" )
setwd( "TMPdirReport" )
file.copy( "../doc/Household_Report.Rmd","Household_Report.Rmd", overwrite = T )
knit2html( 'Household_Report.Rmd', quiet = TRUE )
file.copy( 'Household_Report.html', "../doc/Household_Report.html", overwrite = T )
setwd( "../" )
unlink( "TMPdirReport", recursive = TRUE )      

unlink( "TMPdirSlides", recursive = TRUE )      
dir.create( "TMPdirSlides" )
setwd( "TMPdirSlides" )
file.copy( "../doc/Household_Slides.Rmd","Household_Slides.Rmd", overwrite = T )
slidify( "Household_Slides.Rmd" )
file.copy( 'Household_Slides.html', "../doc/Household_Slides.html", overwrite = T )
setwd( "../" )
unlink( "TMPdirSlides", recursive = TRUE )      
