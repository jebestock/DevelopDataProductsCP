---
title: "Help for Page *Stock Selection and Portfolio Variability*"
output:
  pdf_document: default
  html_document:
 mathjax: "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"
 runtime: shiny
    keep_md: yes
---
Author: Jens Berkmann
#<!-- setwd("C:/Users/jb/gitrepos/RegressionMethods/") -->

## Help for Page *Stock Selection and Portfolio Variability*
On this page you can select 11 different companies listed in
the Dow Jones Industrial Index (DJII) and evaluate the potential profit or loss as of yesterday when a given number of stocks of the chosen company  
would have been purchased a certain number of days back in the past.
The chart of the portfolio value is also shown in an accompanying graph starting from the purchase date until yesterday. 
The page downloads the closing stock prices data from the YAHOO financial server. 





## Input Values on left side of page
On the left side of the page you can first select from 11 listed companies
in the DJII which are given by their usual abbreviations. They are:
* BA  Boeing 
* CAT Caterpillar
* CSCO Cisco Systems
* DIS Walt Disney Company
* GE General Electric
* GS    Goldman Sachs 
* IBM    International Business Machines Corporation
* INTC    Intel Corporation
* JNJ    Johnson & Johnson
* PFE    Pfizer Inc.
* XOM    Exxon Mobil Corporation

In the next 2 lines you can type in the number of stocks as well as a potential purchase date of the selected stock a given number of days back in time from yesterday.
Both numbers given clearly need to be positive integers. The maximum allowed number for the days is 10000.
Note that the days you give are conventional days (7 days/week), however when it comes to displaying of data, only trading days are depicted (5 days/week if no public holidays).
Once you press the *Submit*-Button data downloading/refreshing takes place.


## Output Values on right side of page

On the right part of the page the output is shown which is updated only after you have pressed the *Submit*-Button.

In the first row the selected stock is printed followed by the chosen number of stocks in the second line.

In the third line the initial value 
(purchase price excluding traansaction costs)
of your investment is shown which is nothing but
*NumberOfStocks x PricePerStock(PurchaseDate)* in USD at the date given by you back in the past. Note that we exclude here intraday stock-price variability. We assume
that the stock was purchased at the closing price at that particular day.

In the fourth line the current value of your investment is shown assuming 
the closing price of your stock as of yesterday.

In the fifth line the profit (positive) or loss (negative) in percent of your investment is listed.

Finally, a plot showing the value of your investment over the given time span is displayed.
