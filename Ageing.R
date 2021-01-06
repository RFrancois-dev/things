# I was thinking that lubridate would handle this kind of horror, but it seems it doesn't (or I didn't find out)
# since I lost half a day on this, maybe it will help someone!

# We know the birth date (a date), and the age of somebody (a double).
# Which day are we ? Beware : 0.5 years in 2012 is not == to 0.5 years in 2013 !

Ageing <- function(start, age){
  # first we get the integer part of the age, and compute the date at this age
  roundDate <- as.Date(start) + lubridate::years(floor(age))
  
  # then we add the decimal part, multiplied by the number of days in the last year.
  roundDate +
    (age - floor(age)) * 
    (as.integer(lubridate::make_date(lubridate::year(roundDate), 12, 31) - 
                  lubridate::make_date(lubridate::year(roundDate), 1, 1) + 1))
}

#Example :

start <- as.Date("2020-01-01")
age <- 60.5
Ageing(start, age)
