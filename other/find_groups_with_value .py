"""
Task
Given a simple two-column Pandas dataframe, write a function find_groups_with_value(df, b_val) that returns a new frame containing only groups from column a with a given property in the secondary b column.

For example, given a target b_val of 7 and a dataframe:

   a  b
0  1  7
1  1  5
2  2  8
3  2  6
4  3  7
your find_groups_with_value function should return the following dataframe:

   a  b
0  1  7
1  1  5
4  3  7
The rationale is that 7 appeared in the b column for the 1 and 3 groups, but not in the 2 group which only mapped to 6 and 8.

Note that indices were not reset on the returned dataframe.

As a second example, if the same df parameter as above was given but with a b_val of 42, your function would return an empty dataframe because none of the three groups have a b column with 42 in it.

You may mutate the parameter df.

You can assume the df parameter is guaranteed to have a and b columns exactly and that these columns will always be of integer type.

Note that Pandas' testing library offers excellent diffs upon test failure but uses the somewhat confusing left and right names rather than actual and expected. Keep in mind that left == actual and right == expected. The call will be pd.testing.assert_frame_equal(actual, expected) throughout the challenge.

You may consult Pandas https://pandas.pydata.org/pandas-docs/stable and Python https://docs.python.org/3 documentation.

"""

import pandas as pd

def find_groups_with_value(df: pd.DataFrame, b_val: str) -> pd.DataFrame:
  lst= df[df.b == b_val].a.tolist()
  return df[df.a.isin(lst)]


## Unit Tests

import pandas as pd
import unittest

from solution import find_groups_with_value

class Test(unittest.TestCase):
    def test_basic(self):
        """ Test a basic example
        """
        df = pd.DataFrame({
            "a": [1, 1, 2, 2, 3], 
            "b": [7, 5, 8, 6, 7]
        })
        expected = pd.DataFrame({
            "a": [1, 1, 3],
            "b": [7, 5, 7]
        }, index=[0, 1, 4])
        actual = find_groups_with_value(df, 7)
        pd.testing.assert_frame_equal(actual, expected)

    def test_basic_no_match(self):
        """ Test a basic example with no matches
        """
        df = pd.DataFrame({
            "a": [1, 1, 2, 2, 3], 
            "b": [7, 5, 8, 6, 7]
        })
        expected = pd.DataFrame(
            columns=["a", "b"], 
            dtype="int64", 
            index=pd.Index([], dtype="int64")
        )
        actual = find_groups_with_value(df, 42)
        pd.testing.assert_frame_equal(actual, expected)

    def test_non_contiguous(self):
        """ Test a non-contiguous example
        """
        df = pd.DataFrame({
            "a": [1, 1, 2, 1, 3], 
            "b": [7, 5, 8, 6, 7]
        })
        expected = pd.DataFrame({
            "a": [1, 1, 1],
            "b": [7, 5, 6]
        }, index=[0, 1, 3])
        actual = find_groups_with_value(df, 6)
        pd.testing.assert_frame_equal(actual, expected)

        
        
