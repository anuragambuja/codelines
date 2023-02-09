"""
Task
Have you ever searched for something on a website like Google? No doubt, you have. Google pioneered the PageRank algorithm to determine which websites are more popular, important or relevant than others. The algorithm provides a valuable model for organizing search results and analyzing relationships between nodes in a graph.

In this challenge, you'll write a function simple_pagerank(directory) which extracts links from a directory of HTML files and runs a page rank algorithm on them.

If you're curious about the theory behind PageRank and implementation of the algorithm, check the simplfied PageRank algorithm section on Wikipedia.

For this challenge, you can use Networkx's pagerank function to compute the page rankings. Results should be returned as a dictionary of names of HTML files mapped to their float page rank values.

Example
Examples are located in the webpages/ directory in your workspace. Each is tested by a corresponding function in the test/test_simple_pagerank.py suite. Feel free to modify these sample files and tests as you wish. Your final code submission will be run on files of similar complexity and content.

In the webpages/example0 directory, you'll find the following three HTML file stubs:

webpages/example0/a.html:
<body>
  <a href="b.html">b</a>
</body>
webpages/example0/b.html:
<body>
  <a href="c.html">c</a>
</body>
webpages/example0/c.html:
<body>
  <a href="b.html">b</a>
</body>
The links from these pages form the following directed graph with a cycle:

.---.   .---.   .---.
| a |-->| b |-->| c |
`---`   `---`   `---`
          ^       |
          +-------+
Running the nx.pagerank function on this graph gives the following result dictionary (which is just what your simple_pagerank function should return--key order doesn't matter and floats are compared with a generous epsilon):

{'b.html': 0.4864858243244208, 
 'c.html': 0.4635141756755788, 
 'a.html': 0.05}
b.html has the highest weight because the most pages point to it. c.html also has a high weight: although it only has one incoming edge (link), that edge is from b.html which is a high-ranked page. a.html has no incoming links so it's no surprise that its rank is almost zero.

See workspace/example1 for a slightly more complex example.

Constraints
To keep the challenge scope limited, consider the following constraints to be guaranteed:

directory will only contain .html files.
.html filenames before the extension will only contain lowercase letters and numbers. foo123.html is a valid filename but foo(123).txt.html will not need to be handled.
.html files in directory will contain valid, well-formed HTML.
HTML pages will only contain links to other valid HTML pages in the directory (there will be no broken or external links).
All URLs within the .html files will always be relative. There will not be any subdirectories or paths to contend with. For example, <a href="a2.html">foo</a> is a valid link, assuming a2.html exists, and other links will follow the same format.
As shown above, the inner text of the link could contain anything--use only the href attribute to determine node names.
Rubric
This challenge is evaluated primarily on correctness and secondarily on the extent to which the code is readable and could be considered production-ready in a code review.

Notes
Here are some documentation links which may be useful:

BeautifulSoup https://www.crummy.com/software/BeautifulSoup/bs4/doc/
Networkx https://networkx.github.io/documentation/
Python https://docs.python.org/3/

"""


import networkx as nx
import os
from bs4 import BeautifulSoup

def simple_pagerank(directory: str) -> dict:
    """ 
    Extract links from all .html files in `directory` 
    and return a dict of PageRanks for the pages.
    """
    
    edges = []
    files = os.listdir(directory)
    for file in files:
      url = os.path.join(directory, file)
      page = open(url)
      soup = BeautifulSoup(page.read())
      for a in soup.find_all('a', href=True):
        edges.append((file, a['href']))

    G = nx.DiGraph()
    G.add_edges_from(edges)
    return nx.pagerank(G)

### Unit Tests
import unittest
from helper import assert_float_dict_close
from simple_pagerank import simple_pagerank
    
class Test(unittest.TestCase):
    def test_example0(self):
        actual = simple_pagerank("webpages/example0")
        expected = {
            "b.html": 0.4864858243244208,
            "c.html": 0.4635141756755788,
            "a.html": 0.05
        }
        assert_float_dict_close(actual, expected)
        
    def test_example1(self):
        actual = simple_pagerank("webpages/example1")
        expected = {
            "d.html": 0.13405561248115333,
            "e.html": 0.13405561248115333,
            "b.html": 0.206295105696859,
            "c.html": 0.17780840100739434,
            "a.html": 0.34778526833344015
        }
        assert_float_dict_close(actual, expected)

  
