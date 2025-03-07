# === Define Inputs ===
A_tier_tvl <- 70   # TVL for A-tier (in million)
B_tier_tvl <- 30  # TVL for B-tier (in million)
staked_A_tier_ratio <- 0.5  # Example: 48% of A-tier is staked
B_tier_yield_split <- 0.7   # Example: 29% of total yield goes to B-tier

# === Compute Derived Values ===
total_tvl <- A_tier_tvl + B_tier_tvl
staked_A_tier_tvl <- A_tier_tvl * staked_A_tier_ratio
unstaked_A_tier_tvl <- A_tier_tvl - staked_A_tier_tvl

A_tier_yield_split <- 1 - B_tier_yield_split  # Remainder of yield goes to A-tier

# === Define Total Yield ===
total_yield <- 0.08  # Example: Define the total system-wide yield

# Compute capital splits (percentages)
B_tier_capital_split <- B_tier_tvl / total_tvl
A_tier_capital_split <- A_tier_tvl / total_tvl
staked_A_tier_capital_split <- staked_A_tier_tvl / total_tvl

# Compute per-tier yield based on capital split
B_tier_yield <- (B_tier_yield_split * total_yield) / B_tier_capital_split
staked_A_tier_yield <- (A_tier_yield_split * total_yield) / staked_A_tier_capital_split

# === Print Results ===
cat("Total TVL:", total_tvl, "million\n") 
cat("B_tier TVL:", B_tier_tvl, "million\n")  
cat("A_tier TVL:", A_tier_tvl, "million (staked:", staked_A_tier_tvl, "unstaked:", unstaked_A_tier_tvl, ")\n")  

cat("\nTotal Yield:", total_yield, "\n") 
cat("B_tier Yield:", B_tier_yield, "\n")  
cat("staked_A_tier Yield:", staked_A_tier_yield, "\n")  

cat("\nYield Splits:\n")
cat("B_tier Yield Split:", B_tier_yield_split, "\n")  
cat("A_tier Yield Split:", A_tier_yield_split, "\n")  

cat("\nCapital Splits:\n")
cat("B_tier Capital Split:", B_tier_capital_split, "\n")  
cat("A_tier Capital Split:", A_tier_capital_split, "\n")  
cat("Staked_A_tier Capital Split:", staked_A_tier_capital_split, "\n")


