# -*- coding: utf-8 -*-
"""
Created on Sun Feb 25 23:15:49 2018

@author: vinut
"""

import matplotlib.pyplot as plt
import sklearn.linear_model
import pandas as pd
import numpy as np
'The Superstore dataset is gathered from Tableau Community'
'The Superstore dataset is gathered from Tableau Community'
'The concept is not duplicated from any website'
'The code pieces were searched from various websites but the integrated code here is original'
file_loc = "V:\DSP\Datasets\Superstore.xls"
df = pd.read_excel(file_loc, index_col=None, na_values=['NA'], usecols = "A:U")
'Product Based Analysis'
print("************************************************************************")
print("=========   4 dimensional Retail Sales Analysis Application   ===========")
print("*************************************************************************")
print("$$Retail Super Store Sales Analyser based on location,Time and Product$$")
Product = raw_input("Enter the Product name to analyse?")
df_test = df.loc[df['Product_Category'] == Product]
Sales = df_test['Sales'].sum()
print("The Overall Sales for %s is, %s" %(Product,Sales))
'Location based Analysis'
Location= input('''Enter your preference?
                    1.Country - (United States Only)
                    2.Regional
                    3.State
                    4.City''')

if Location == 1:
    Country = raw_input("Enter the Country name")
    df_Country = df.loc[df['Country'] == Country]
    Sales_Country = np.array(df_Country['Sales'])
    Sales_Country_Sum =df_Country['Sales'].max()
    print("Total Sales Value %s" % Sales_Country_Sum)
    Sales_Analysis = raw_input("Do you want to analyse more? Y/N")
    if Sales_Analysis == 'Y':
        print("Mean Sales:       ", Sales_Country.mean())
        print("Standard deviation:", Sales_Country.std())
        print("Minimum Sales:    ", Sales_Country.min())
        print("Maximum Sales:    ", Sales_Country.max())
    
    # Prepare the data
        X = np.c_[df_Country["Sales"]]
        y = np.c_[df_Country["Profit"]]
    
    # Visualize the data
        df_Country.plot(kind='scatter', x='Sales', y='Profit')
        plt.show()
    
    # Select a linear model
        model = sklearn.linear_model.LinearRegression()
    
    # Train the model
        model.fit(X, y)

    #Sales_Country = df.Country['Sales'].sum()
    #print("The Sales Value across all superstores of USA is  %s" %Sales_Country)
elif Location == 2:
    Region = raw_input("Enter the region to analyse? (South, West,Central,East)")
    Date = raw_input("Enter the Monthly Sales you wish to analyse (MonYY) format")
    df_region = df.loc[(df['Region'] == Region) & (df['Product_Category'] == Product) & (df['Date'] == Date)]
    Sales_region = np.array(df_region['Sales'])
    Sales_region_Sum =df_region['Sales'].sum()
    print("Total Sales Value %s" % Sales_region_Sum)
    Sales_Analysis = raw_input("Do you want to analyse more? Y/N")
    if Sales_Analysis == 'Y':
        print("Mean Sales:       ", Sales_region.mean())
        print("Standard deviation:", Sales_region.std())
        print("Minimum Sales:    ", Sales_region.min())
        print("Maximum Sales:    ", Sales_region.max())
    
    # Prepare the data
        X = np.c_[df_region["Sales"]]
        y = np.c_[df_region["Profit"]]
    
    # Visualize the data
        df_region.plot(kind='scatter', x='Sales', y='Profit')
        plt.show()
    
    # Select a linear model
        model = sklearn.linear_model.LinearRegression()
    
    # Train the model
        model.fit(X, y)
elif Location == 3:
    State = raw_input("Enter the region to analyse? (e.g. Florida, Texas)")
    df_State = df.loc[(df['State'] == State) & (df['Product_Category'] == Product)]
    Sales_State = df_State['Sales'].sum()
    print("The Sales Value of %s across superstores in %s state of USA is,  %s " %(Product,State,Sales_State))
    Sales_Analysis = raw_input("Do you want to analyse more? Y/N")
    if Sales_Analysis == 'Y':
        print("Mean Sales:       ", Sales_State.mean())
        print("Standard deviation:", Sales_State.std())
        print("Minimum Sales:    ", Sales_State.min())
        print("Maximum Sales:    ", Sales_State.max())
    # Prepare the data
        X = np.c_[df_State["Sales"]]
        y = np.c_[df_State["Profit"]]
    
    # Visualize the data
        df_State.plot(kind='scatter', x='Sales', y='Profit')
        plt.show()
    
    # Select a linear model
        model = sklearn.linear_model.LinearRegression()
    
    # Train the model
        model.fit(X, y)
    #print("The Sales Value of %s across superstores in %s state of USA is,  %s " %(Product,State,Sales_State))
elif Location == 4:
    City = raw_input("Enter the region to analyse? (e.g. Tampa)")
    df_city = df.loc[(df['City'] == City) & (df['Product_Category'] == Product)]
    Sales_City = df_city['Sales'].sum()
    print("The Sales Value of %s across superstores in %s City of USA is,  %s " %(Product,City,Sales_City))
    if Sales_Analysis == 'Y':
        print("Mean Sales:       ", Sales_City.mean())
        print("Standard deviation:", Sales_City.std())
        print("Minimum Sales:    ", Sales_City.min())
        print("Maximum Sales:    ", Sales_City.max())
        # Prepare the data
        X = np.c_[df_city["Sales"]]
        y = np.c_[df_city["Profit"]]

# Visualize the data
    df_city.plot(kind='scatter', x='Sales', y='Profit')
    plt.show()

# Select a linear model
    model = sklearn.linear_model.LinearRegression()

# Train the model
    model.fit(X, y)
    
else:
        print("****")
#Product = input("What is the product you want to search ?")
#df =