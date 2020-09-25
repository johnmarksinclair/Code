import yfinance as yf
import pandas as pd
import csv

df = pd.read_excel('Complete_List.xlsx')
symbols = df['Symbol'].values.tolist()

#df = pd.read_excel('SP500.xlsx')
#symbols = df['A'].values.tolist()

'''
Goals
marketCap > 100 mil
marketCap > enterpriseValue
heldPercentInsiders > 0.2
cash > debt
high return on equity
'''

for i in symbols:
    stock = yf.Ticker(i)
    try:
        if stock.info['sector'] != 'Healthcare':
            if stock.info['heldPercentInsiders'] > 0.2:
                if stock.info['marketCap'] > 100000000:
                    if stock.info['ask'] > (stock.info['fiftyTwoWeekLow']+((stock.info['fiftyTwoWeekHigh']-stock.info['fiftyTwoWeekLow'])/2)):
                        if stock.info['marketCap'] > stock.info['enterpriseValue']:
                            print(stock.info['symbol'])
                            with open('hits.csv','a') as fd:
                                fd.write(stock.info['symbol']+'\n')
    except:
        pass

#pd.DataFrame(hit_list).to_excel('HitList.xlsx', header=False, index=False)