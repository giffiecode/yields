# Define TVL amounts as variables (in million)
RLP_tvl <- 105   # from dune / website 
total_USR_tvl <- 538   # from dune / website  
stUSR_tvl <- 207 # from dune     
USR_tvl <- total_USR_tvl - stUSR_tvl   

# Function to calculate total balance
total_balance <- function(RLP, USR, stUSR) {
  total <- RLP + USR + stUSR
  return(total)
}

# Calculate total balance
total_tvl <- total_balance(RLP_tvl, USR_tvl, stUSR_tvl)
cat("Total TVL:", total_tvl, "million\n") 

# Define yield % as variables   
RLP_yield <- 0.111
stUSR_yield <- 0.0587 

# Function to calculate total yield 
total_yield <- function(RLP_tvl, stUSR_tvl, total_tvl, RLP_yield, stUSR_yield) {
  (RLP_tvl / total_tvl) * RLP_yield + (stUSR_tvl / total_tvl) * stUSR_yield 
} 

# Compute and print the total yield
backings_yield <- total_yield(RLP_tvl, stUSR_tvl, total_tvl, RLP_yield, stUSR_yield)
cat("Total Yield:", backings_yield, "\n") 

yield_split <- function(backings_yield, total_tvl, portion_tvl, portion_yield) {
  (portion_tvl*portion_yield) / (backings_yield*total_tvl) 
}  

RLP_yield_split <- yield_split(backings_yield, total_tvl, RLP_tvl, RLP_yield) 
stUSR_yield_split <- yield_split(backings_yield, total_tvl, stUSR_tvl, stUSR_yield)  

cat("RLP yield split:", RLP_yield_split, "\n")  
cat("stUSR yield split:", stUSR_yield_split, "\n")  


capital_split <- function(total_tvl, portion_tvl) {
  portion_tvl/total_tvl
} 

RLP_capital_split <- capital_split(total_tvl, RLP_tvl)   
USR_capital_split <- capital_split(total_tvl, total_USR_tvl) 


cat("RLP capital split:", RLP_capital_split, "\n")  
cat("stUSR capital split:", USR_capital_split, "\n")  

