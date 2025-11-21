import requests
from bs4 import BeautifulSoup
import pandas as pd

url = "https://www.kaggle.com/datasets/faresashraf1001/supermarket-sales"
response = requests.get(url)

soup = BeautifulSoup(response.text, 'html.parser')

products = []
for item in soup.select('.product-card'):
    name = item.select_one('.product-name').text
    price = float(item.select_one('.price').text.replace('$', ''))
    rating = float(item.select_one('.rating').text)
    reviews = int(item.select_one('.reviews').text.split()[0])
    category = item.select_one('.category').text
    products.append([name, price, rating, reviews, category])
df = pd.DataFrame(products, columns=['Product Name', 'Price', 'Rating', 'Reviews', 'Category'])
df.to_csv('Supermarket_sales CSV Formate', index=False)

import seaborn as sns
import matplotlib.pyplot as plt
from scipy.stats import pearsonr

# Load data
df = pd.read_csv('Supermarket_sales CSV Formate')

# Clean data
df.dropna(inplace=True)

# EDA
sns.histplot(df['Price'], bins=30)
plt.title('Price Distribution')
plt.show()

# Correlation
corr, _ = pearsonr(df['Price'], df['Rating'])
print(f"Correlation between Price and Rating: {corr:.2f}")
