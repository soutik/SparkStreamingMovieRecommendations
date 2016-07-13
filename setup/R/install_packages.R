
packages_to_install <- c('repr','pbdZMQ','devtools','stringr',
						'dplyr','ggplot2','Hmisc','jsonlite',
						'reshape2', 'Rcpp', 'RPostgreSQL',
						'rkafka', 'rkafkajars', 'tidyr','RCurl')

new_packages <- packages_to_install[!(packages_to_install %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new_packages,repos='http://cran.us.r-project.org')

library("devtools")
install_github('IRkernel/repr')
install_github('IRkernel/IRdisplay')
install_github('IRkernel/IRkernel')
IRkernel::installspec(user=FALSE)

