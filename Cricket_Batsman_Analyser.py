# -*- coding: utf-8 -*-
"""
Created on Tue Feb 20 01:53:39 2018

@author: vinut
"""

import random
class Player:
    '''A Class that models a batsman, runs scored, balls faced and the strike rate
    by a batsman in a cricket game'''
    valuePair = {}
    def __init__(self, firstName):
        self.firstName = firstName
        #self.run = run
 # self.lastName = lastName        fullname = firstName + lastName        print(fullname)

    '''The below function calculates the runs scored and balls faced in a game'''
    def runs(self, run):
        #self.run = run
        thisScore = 0
        self.randList = []
        balls = random.randint(0,run)
        df = pd.read_csv(r'V:\DSP\Star_Players.csv', names =['Player','score'])
        df.isin([self.firstName])
        print("")
        for i in range(balls):
            scoreoptions = [0,-1,1,2,3,4,6]
            rand1 = random.choice(scoreoptions)
          #  print(rand1)
            if(rand1>0 and thisScore<run and i<balls):
                thisScore +=rand1
                self.randList.append(rand1)
        #print(randList)

        self.valuePair = {'score': thisScore, 'ballfaced': balls}
        return(self.valuePair)
    '''The below function calculates the strike rate of a batsman in the game'''
    def strikerate(self):
        a= self.valuePair.get('score')
        b= self.valuePair.get('ballfaced')
        sr = (a/b)*100
        return sr
    def scoreanalysis(self):
        runbyball = self.randList
        return runbyball
'''Below is the program that gets run time input from user and performs actions'''
import pandas as pd
print("                ***This is a IPL Auction Advisor***"         )
name = input("Who's is your player? ")

'Class Object created'
player1 = Player(name) 

'External file accessed - Source - spncricinfo'
df = pd.read_csv(r'V:\DSP\Star_Players.csv', names =['Player','score']) 
myList = df.values.tolist()

'List is verified if the favourite player is a Star player'
if any( name in s for s in myList):
    passin=random.randint(50,150)
    player1.runs(passin)
else:
    otherwise = input("What is the highest score?")
    player1.runs(int(otherwise))
'Program delivers Output'
print("In the next game, %s is *expected* to score"%name)
print(player1.valuePair.get('score'))
print()
print("%s is *expected* to score at the Strike Rate "%name)
print(player1.strikerate())
print()
print("Do you want to Analyse more? Enter( Yes/No)")
answer =input()
if(answer=="Yes"):
    print("Total number of balls faced by the batsman")
    print(player1.valuePair.get('ballfaced'))
    print()
    print("***Here's the ball by ball analysis***")
    print(player1.scoreanalysis())
else:
    print("***")
    
