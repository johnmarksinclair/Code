import yfinance as yf

aapl = yf.Ticker("PFE")

info = sorted([[k,v] for k,v in aapl.info.items()])

for k,v in info:
    print(f'{k} : {v}')