# -*- coding: utf-8 -*-
class TextFrequency():
    def __init__(self, file_name):
        self.text = []
        self.file_name = file_name
        self.text = self.getText()
   
       
    def getText(self):
        file = open(self.file_name, 'r')
        lyrics = file.read()
        lyrics = lyrics.replace('\n',' ')
        lyrics = lyrics.split(' ')
        file.close
        return lyrics
    
    def letterFreq(self):
        lFreq = ""
        for ele in self.text:
            lFreq += ele
        freq = {}
        for letter in lFreq: 
            if letter in freq: 
                freq[letter] += 1
            else: 
                freq[letter] = 1
        return freq
    
    def wordFreq(self):
        wFreq = self.text
        freq = {}
        for word in wFreq: 
            if word in freq: 
                freq[word] += 1
            else: 
                freq[word] = 1
        return freq
    
    def toLower(self):
        self.text = [text.lower() for text in self.text]
        
class HistogramPrinter(TextFrequency):
    
    def __init__(self, file_name):
        TextFrequency.__init__(self, file_name)
        
    def printLetterHist(self):       
        freq = TextFrequency.letterFreq(self)
        for letter in freq:
           print(letter, '*' * freq[letter])
           
    def printWordHist(self):
        freq = TextFrequency.wordFreq(self)
        for word in freq:
            print(word, '*' * freq[word])
        
myTF = TextFrequency('lyrics.txt')

myHist = HistogramPrinter('lyrics.txt')
myHist.toLower()

myHist.printLetterHist()
'''
letterFreq = myTF.letterFreq()
for letter in letterFreq:
    print(letter, letterFreq[letter])
'''
myHist.printWordHist()
'''
wordFreq = myTF.wordFreq()
for word in wordFreq:
    print(word, wordFreq[word])
'''