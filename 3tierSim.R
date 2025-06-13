# === Define Inputs ===
A_tier_tvl <- 90         # A-tier total TVL (in million)
stA_ratio <- 0.5         # Fraction of A-tier that is staked
B_plus_tvl <- 8         # B+ TVL (in million)
B_tvl <- 2              # B TVL (in million)

# === Yield Allocation (only stA, B+, and B earn yield) ===
yield_split_stA <- 0.7     
yield_split_B_plus <- 0.15
yield_split_B <- 0.15

# === Validate Yield Split ===
total_yield_split <- yield_split_stA + yield_split_B_plus + yield_split_B
if (total_yield_split != 1) stop("Yield splits must sum to 1")

# === Define Total Yield ===
total_yield <- 0.05   

# === Compute Derived TVL ===
stA_tvl <- A_tier_tvl * stA_ratio
unstaked_A_tvl <- A_tier_tvl - stA_tvl
total_tvl <- A_tier_tvl + B_plus_tvl + B_tvl

# === Compute Capital Splits for Yield-Earning Tiers ===
cap_split_stA <- stA_tvl / total_tvl
cap_split_B_plus <- B_plus_tvl / total_tvl
cap_split_B <- B_tvl / total_tvl

# === Compute APYs (Annual Yield % for capital in each tier) ===
yield_stA <- (yield_split_stA * total_yield) / cap_split_stA
yield_B_plus <- (yield_split_B_plus * total_yield) / cap_split_B_plus
yield_B <- (yield_split_B * total_yield) / cap_split_B

# === Print Results ===
cat("Total TVL:", total_tvl, "million\n")
cat("A-tier:", A_tier_tvl, "million (staked:", stA_tvl, "unstaked:", unstaked_A_tvl, ")\n")
cat("B+ tier:", B_plus_tvl, "million\n")
cat("B tier :", B_tvl, "million\n\n")

cat("Capital Splits (out of total TVL):\n")
cat("- stA:", cap_split_stA, "\n")
cat("- B+ :", cap_split_B_plus, "\n")
cat("- B  :", cap_split_B, "\n\n")

cat("Yield Splits (of total yield):\n")
cat("- stA:", yield_split_stA, "\n")
cat("- B+ :", yield_split_B_plus, "\n")
cat("- B  :", yield_split_B, "\n\n")

cat("Resulting APYs:\n")
cat("- stA Yield:", round(yield_stA * 100, 2), "%\n")
cat("- B+  Yield:", round(yield_B_plus * 100, 2), "%\n")
cat("- B   Yield:", round(yield_B * 100, 2), "%\n")
