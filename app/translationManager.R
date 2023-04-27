library(R6)

Translator <- R6Class(
  classname = "Translator",
  public = list(
    languages = unique(cryptdata$lang),
    lang_pack = function(x) {
      switch (
        x,
        "R" = private$packages_r,
        "Python" = private$packages_py,
        "Postgresql" = "No Library"
      )
    },
    lock_and_load_syntax = function(funct,language,module,
                                   values,nameFrame,
                                   nameCol1,nameCol2) {
      syn <- cryptdata %>% 
        filter(func == funct, lang == language, mod == module) %>% 
        pull(syntax)
      language <- language
      df <- nameFrame
      col1 <- nameCol1
      col2 <- nameCol2
      values <- values
      logical_ops_1 <- ifelse(language == "Postgresql",
                             ifelse(str_detect(values[1],"\\d+"),">=","="),
                             ifelse(str_detect(values[1],"\\d+"),">=","=="))
      logical_ops_2 <- ifelse(language == "Postgresql",
                             ifelse(str_detect(values[3],"\\d+"),"<","="),
                             ifelse(str_detect(values[3],"\\d+"),"<","=="))
      value_1 <- values[1]
      value_2 <- values[3]
      
      final_syn <- ifelse(funct=="rename columns" & language=="Python" & module=="pandas",
                        glue(syn,df=df,
                             col1=col1, col2=col2,
                             val1=values[1], val2=values[2], 
                             val3=values[3], val4=values[4],
                             logical_ops_1=logical_ops_1,
                             logical_ops_2=logical_ops_2,
                             value_1= value_1,
                             value_2= value_2,
                             .open = "<",.close = ">"),
                        glue(syn,df=df,
                             col1=col1, col2=col2,
                             val1=values[1], val2=values[2], 
                             val3=values[3], val4=values[4],
                             logical_ops_1=logical_ops_1,
                             logical_ops_2=logical_ops_2,
                             value_1= value_1,
                             value_2= value_2)
      ) 
      final_syn <- gsub('<br/>','\n',final_syn)
      return(final_syn)
    },
    get_values = function(x,y){
      col1 <- x
      col2 <- y
      df <- lol_champions_code %>% select(col1,col2)
      choice1 = unique(df[,col1][[1]])
      choice2 = unique(df[,col2][[1]])
      choices = list('first_choice'=choice1,'second_choice'=choice2)
      return(choices)
    }
  ),
  private = list(
    packages_r = c('dplyr', 'data.table'),
    packages_py = c('pandas')
  )
)
