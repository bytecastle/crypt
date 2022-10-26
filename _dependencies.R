# ---------- LIBRARIES ---------#
# Installation & Loading of packages
if (!require("tidyverse")){
  install.packages("tidyverse",dependencies = T)
  library(tidyverse)
}

if (!require("shinydashboard")){
  install.packages("shinydashboard",dependencies = T)
  library(shinydashboard)
}

if (!require("shinydashboardPlus")){
  install.packages("shinydashboardPlus",dependencies = T)
  library(shinydashboardPlus)
}

if (!require("data.table")){
  install.packages("data.table",dependencies = T)
  library(data.table)
}

if (!require("yaml")){
  install.packages("yaml",dependencies = T)
  library(yaml)
}

if (!require("glue")){
  install.packages("glue",dependencies = T)
  library(glue)
}

if (!require("shinythemes")){
  install.packages("shinythemes",dependencies = T)
  library(shinythemes)
}

if (!require("shinyWidgets")){
  install.packages("shinyWidgets",dependencies = T)
  library(shinyWidgets)
}

if (!require("shinyjs")){
  install.packages("shinyjs",dependencies = T)
  library(shinyjs)
}

if (!require("DT")){
  install.packages("DT",dependencies = T)
  library(DT)
}

if (!require("formattable")){
  install.packages("formattable",dependencies = T)
  library(formattable)
}

if (!require("reticulate")){
  install.packages("reticulate",dependencies = T)
  library(reticulate)
}
