import requests
from bs4 import BeautifulSoup
import pandas as pd
from datetime import datetime, timedelta
from tqdm import tqdm
import concurrent.futures
import time

# List of Stock Tickers
tickers = ["TSLA", "AAPL", "AMZN", "MSFT", "GS", "JPM", "BAC", "WFC"]

# Date Range
start_date = datetime(2019, 1, 2)
end_date = datetime(2025, 3, 19)

# Empty list to store results
all_news_data = []

# Bing News Base URL
bing_url = "https://www.bing.com/news/search?q={ticker}+stock&qs=n&form=QBNT&sp=-1&pq={ticker}+stock&sc=8-11&sk=&cvid="

# Requesting headers to mimic browser
headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36"
}

# Define function to fetch news for each ticker and date range
def fetch_news_for_ticker(ticker):
    global all_news_data
    current_date = start_date

    while current_date <= end_date:
        # Bing Search URL with ticker and date
        search_url = bing_url.format(ticker=ticker)

        try:
            # Sending HTTP Request
            response = requests.get(search_url, headers=headers, timeout=10)
            print(response.text)

            if response.status_code == 200:
                soup = BeautifulSoup(response.text, "html.parser")
                articles = soup.find_all("div", class_="news-card newsitem cardcommon b_cards2")
                print(f"Fetched {len(articles)} articles for {ticker}")
                soup = BeautifulSoup(response.text, "html.parser")
                articles = soup.find_all("div", class_="news-card")  # Double-check the tag
                print(f"Fetched {len(articles)} articles for {ticker}")


                for article in articles:
                    try:
                        title = article.find("a").text
                        link = article.find("a")["href"]
                        summary = article.find("div", class_="snippet").text
                        date_str = article.find("div", class_="source").text.split(" · ")[-1]

                        # Converting date to standard format
                        try:
                            date_obj = datetime.strptime(date_str, "%b %d, %Y")
                        except ValueError:
                            date_obj = current_date

                        # Appending data to the list
                        all_news_data.append(
                            {
                                "date": date_obj.strftime("%Y-%m-%d"),
                                "stock": ticker,
                                "title": title,
                                "summary": summary,
                                "url": link,
                            }
                        )
                    except Exception as e:
                        print(f" Error parsing article for {ticker}: {e}")

            else:
                print(f" Error fetching news for {ticker}. Status Code: {response.status_code}")

        except requests.exceptions.RequestException as e:
            print(f" Request error for {ticker}: {e}")

        # Move to the next week
        current_date += timedelta(days=7)

        # Adding delay to avoid rate limiting
        time.sleep(1)

# Parallel Processing with ThreadPool
with concurrent.futures.ThreadPoolExecutor(max_workers=5) as executor:
    list(tqdm(executor.map(fetch_news_for_ticker, tickers), total=len(tickers), desc="Fetching news for all tickers"))

# Converting to DataFrame
news_df = pd.DataFrame(all_news_data)
print(all_news_data)
if not all_news_data:
    print("No data to save. Check parsing or article extraction!")
    exit()
# Saving to CSV
csv_file = r"..\data\raw\historical_news_sentiment_scraped.csv"
news_df.to_csv(csv_file, index=False)
print(f"\nHistorical news sentiment data saved to: {csv_file}")
