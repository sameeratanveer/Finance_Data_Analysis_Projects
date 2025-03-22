import pandas as pd
from textblob import TextBlob

# Sentiment analysis: Function to determine the sentiment of a given text
def get_sentiment(text):
    if pd.isnull(text):
        return "Neutral"
    analysis = TextBlob(text)
    if analysis.sentiment.polarity > 0: 
        return 'Positive'
    elif analysis.sentiment.polarity < 0: 
        return "Negative"
    else: 
        return "Neutral"

# Loading the historical sentiment data from the CSV file
input_file = r'..\data\raw\historical_news_sentiment_cleaned.csv'
df = pd.read_csv(input_file)

# Applying sentiment analysis on the 'summary' column
df['sentiment'] = df['summary'].apply(get_sentiment)

# Mapping sentiment to numerical values for aggregation
sentiment_mapping = {"Positive": 1, "Neutral": 0, "Negative": -1}
df["sentiment_score"] = df["sentiment"].map(sentiment_mapping)

# Aggregating sentiment per date & stock
agg_sentiment_df = df.groupby(["date", "stock"], as_index=False).agg(
    avg_sentiment=("sentiment_score", "mean"),
    total_articles=("sentiment", "count"),
    positive_articles=("sentiment", lambda x: (x == "Positive").sum()),
    negative_articles=("sentiment", lambda x: (x == "Negative").sum()),
    neutral_articles=("sentiment", lambda x: (x == "Neutral").sum())
)

# Defining sentiment trend based on avg_sentiment
def classify_trend(score):
    if score > 0.6:
        return "Positive"
    elif score < 0.4:
        return "Negative"
    else:
        return "Neutral"

# Applying trend classification based on average sentiment score
agg_sentiment_df["overall_sentiment"] = agg_sentiment_df["avg_sentiment"].apply(classify_trend)

# Removing unnecessary columns to keep only the relevant ones
required_sentiment_df = agg_sentiment_df[['date', 'stock', 'avg_sentiment', 'overall_sentiment']]

# Defining the path to save the cleaned and aggregated sentiment data
output_file = r'..\data\raw\aggregated_sentiment_data.csv'

# Saving the aggregated sentiment data to a CSV file
required_sentiment_df.to_csv(output_file, index=False)

# Printing confirmation message
print(f"Aggregated sentiment data saved to {output_file}")
