import pandas as pd

# Defining file paths for the datasets
stock_data_file = r'..\data\raw\stock_data_long.csv'
sentiment_data_file = r'..\data\raw\aggregated_sentiment_data.csv'

# Loading the long format stock data and sentiment data into pandas DataFrames
stock_df = pd.read_csv(stock_data_file)
sentiment_df = pd.read_csv(sentiment_data_file)

# Merging the two DataFrames on 'date' and 'stock'
merged_df = pd.merge(stock_df, sentiment_df, on=['Date', 'stock'], how='left')

# Filling missing sentiment values
merged_df['avg_sentiment'].fillna(0.3, inplace=True)  # Setting missing avg_sentiment to 0.3
merged_df['overall_sentiment'].fillna("Neutral", inplace=True)  # Setting missing overall_sentiment to "Neutral"

# Saving the merged data with default sentiment values for missing entries
merged_file = r'..\data\raw\merged_stock_sentiment_data_with_defaults.csv'
merged_df.to_csv(merged_file, index=False)

# Printing confirmation message
print(f"Merged data with default sentiment saved to {merged_file}")
