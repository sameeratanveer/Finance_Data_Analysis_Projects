import pandas as pd

# Define the file paths
input_file_path = r'..\data\raw\historical_news_sentiment_scraped.csv'
output_file_path = r'..\data\raw\historical_news_sentiment_cleaned.csv'

# Loading the historical news sentiment data
sentiment_data = pd.read_csv(input_file_path)

# Droping the 'title' and 'url' columns
sentiment_data_cleaned = sentiment_data.drop(columns=['title', 'url'])

# Saving the cleaned data to the new location
sentiment_data_cleaned.to_csv(output_file_path, index=False)

# Printing confirmation
print(f"Cleaned sentiment data saved to {output_file_path}")
