library(readr)
library(stringr)
library(TurtleGraphics)

sequences <- read_csv("sequences.csv", col_types = cols(id = col_integer(), random = col_integer()))


# Drawing the 1/0 with turtle drawing

turtle_init()  
turtle_hide()

# Just set plot.random to 1 to plot random strings and set to 0 for plotting
# human-generated strings

draw.turtle<-function(sequence,plot.random){
  turtle_setpos(50,50)
  turtle_setangle(0)
  
  if (plot.random==sequence$random){
  
    digits <- str_length(sequence$sequence)
    for (index in c(1:digits)){
      digit<-str_sub(sequence$sequence,index,index)
      if (digit=="1"){
        turtle_right(90)
      } else {
        turtle_left(90)
      }
      turtle_forward(1)
    }
  }
}

# Plotting all the data together
for (seq in 1:nrow(sequences)){
  draw.turtle(sequences[seq,],1)
}

