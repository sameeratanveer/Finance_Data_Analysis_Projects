# Stock Market Sentiment & Price Prediction System (Ongoing) 
## Overview: 
<details>
  ➜ This project aims to predict stock prices by combining historical stock data with financial news sentiment analysis. 
  
  ➜ By analyzing stock trends and market sentiment over the last 5 years, we aim to develop a predictive model using XGBoost & LSTM.
</details>

## Project Status: Ongoing 
### ✅ Completed:

#### 1. Automated Stock Data Retrieval:
**Collected 5 years of stock price data for MSFT, TSLA, AMZN, AAPL, JPM, GS, BAC, WFC using yfinance**
<details>
  ➜ Fetched daily stock price data for 7 major stocks:

  ➜ Tech Stocks: Tesla (TSLA), Apple (AAPL), Amazon (AMZN), Microsoft (MSFT)

  ➜ Finance Stocks: Goldman Sachs (GS), JPMorgan Chase (JPM), Bank of America (BAC)

  ➜Index & Banking:  Wells Fargo (WFC)

  Data is automatically updated using Python with yfinance to maintain real-time accuracy.
</details>

#### 2. Sentiment Analysis on Stock News/Tweets:
**Web-scraped financial news using Bing & performed sentiment analysis (Positive, Negative, Neutral)**

<details>
  ➜ Collected latest stock-related news headlines and social media data.

 ➜ Applied VADER (Valence Aware Dictionary and sEntiment Reasoner) for sentiment analysis.

  ➜ Grouped sentiment scores (Positive, Neutral, Negative) at the stock-date level to identify market sentiment trends.
</details>

#### 3. Data Transformation & Feature Engineering:
1. Merged stock price data with sentiment data by stock and date.

2. Created multiple features for price prediction
<details>
1. Price Change % – Percentage change in closing price.

2. Volatility (7-day rolling) – Measures recent price fluctuation.

3. RSI (Relative Strength Index) – Indicates overbought/oversold levels.

4. Sentiment Averages (7-day, 30-day) – Tracks sentiment trends. and more...
</details>


### 🚀 Next Steps:

#### 1. Time-Series Price Prediction (Next Phase):

  ➜ Implementing ARIMA, Prophet, and LSTM models to predict stock price movement.

  ➜ Incorporating sentiment impact into prediction models for enhanced accuracy.

#### 2. Power BI Dashboard Integration (In Progress):
<details>
  ➜ Built a real-time Power BI Dashboard for stock analysis and sentiment impact visualization.

  Key Visuals:

  ➜ KPI Cards (Latest Price, Previous Close, Price Change %, Sentiment Score)

  ➜ Sentiment Trends vs. Price Changes

  ➜ Correlation Heatmaps and Rolling Averages
</details>

## Tech Stack & Tools 🛠
Programming: Python 🐍

**Data Collection**: yfinance, BeautifulSoup, requests

**Sentiment Analysis**: VADER, TextBlob, NLTK

**Machine Learning**: XGBoost, LSTM, Scikit-Learn

**Visualization**: Matplotlib, Seaborn, Plotly

**Dashboard**: POWERBI

**Deployment**: Flask (Planned)



