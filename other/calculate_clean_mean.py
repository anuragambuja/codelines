"""
The mean and standard deviation of a sample of data can be thrown off if the sample contains one or many outlier(s) 

http://www.ukoln.ac.uk/web-focus/webwatch/reports/hei-lib-may1998/report.html

For this reason, it is usually a good idea to check for and remove outliers before computing the mean or the standard deviation of a sample. To this aim, your function will receive a list of numbers representing a sample of data. Your function must remove any outliers and return the mean of the sample, rounded to two decimal places (round only at the end).

Since there is no objective definition of "outlier" in statistics, your function will also receive a cutoff, in standard deviation units. For example, if the cutoff is 3, then any value that is more than 3 standard deviations above or below the mean must be removed. Notice that, once outlying values are removed in a first "sweep", other less extreme values may then "become" outliers, that you'll have to remove as well!

Example :

sample = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 100]
cutoff = 3
clean_mean(sample, cutoff) → 5.5
Formula for the mean : https://en.wikipedia.org/wiki/Mean

Formula for the standard deviation : https://en.wikipedia.org/wiki/Standard_deviation#Estimation



(where N is the sample size, xi is observation i and x̄ is the sample mean)

Note : since we are not computing the sample standard deviation for inferential purposes, the denominator is n, not n - 1.

"""

def clean_mean(sample, cutoff):
  
    mean = round(sum(sample)/len(sample),2)
    sd = (sum([(i-mean)**2 for i in sample])/len(sample))**0.5
    cut_off = sd * cutoff
    lower, upper = mean - cut_off, mean + cut_off
    outliers = [x for x in sample if x < lower or x > upper]
    sample = [x for x in sample if x >= lower and x <= upper]
    mean = clean_mean(sample, cutoff) if outliers else mean
    return mean
  
  
from unittest import TestCase
from solution import clean_mean

class Test(TestCase):
    def test_example(self):
        " Example test case "
        sample = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 100]
        cutoff = 3
        self.assertAlmostEqual(clean_mean(sample, cutoff), 5.5)  
        
