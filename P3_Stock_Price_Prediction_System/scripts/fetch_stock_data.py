import yfinance as yf
import pandas as pd
from datetime import datetime
import os

# Defining the list of stocks (Tech + Finance + Market Index)
stocks = ["TSLA", "AAPL", "AMZN", "MSFT", "GS", "JPM", "BAC", "WFC"]

# Extend end date by 1 day to include yesterday’s data
end_date = (datetime.today()).strftime('%Y-%m-%d')

# Downloading stock data (last 5 years + yesterday)
data = yf.download(stocks, start="2019-01-01", end=end_date)

# Flattening multi-level columns (e.g., ('Close', 'AAPL') → 'AAPL_Close')
data.columns = ['_'.join(col).strip() for col in data.columns.values]

# Reset index to move 'Date' into a column
data.reset_index(inplace=True)

# **Wide Format**: Already available in the `data` DataFrame
# Defining the path for the wide-format CSV file
wide_csv_file = r'../data/raw/stock_data_wide.csv'
os.makedirs(os.path.dirname(wide_csv_file), exist_ok=True)

# Saving the wide-format data to CSV
data.to_csv(wide_csv_file, index=False)

# **Long Format**: Melting the data to long format
data_long = pd.melt(data, id_vars=['Date'], value_vars=[col for col in data.columns if col != 'Date'],
                    var_name='Stock_Attribute', value_name='Value')

# Spliting the 'Stock_Attribute' into two columns: 'Stock' (e.g., 'AAPL') and the actual attribute (e.g., 'Close')
data_long[['Stock', 'Attribute']] = data_long['Stock_Attribute'].str.split('_', expand=True)

# Pivoting the data so each stock is a column and the attributes (Close, High, etc.) are rows
data_long_pivot = data_long.pivot_table(index=['Date', 'Attribute'], columns='Stock', values='Value', aggfunc='first').reset_index()

# Define the path for the long-format CSV file
long_csv_file = r'..\data\raw\stock_data_long.csv'
os.makedirs(os.path.dirname(long_csv_file), exist_ok=True)

# Saving the long-format data to CSV
data_long_pivot.to_csv(long_csv_file, index=False)

# Print confirmation messages
print(f"✅ Stock data saved to wide format at {wide_csv_file}")
print(f"✅ Stock data saved to long format at {long_csv_file}")
