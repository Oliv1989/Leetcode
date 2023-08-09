"""
Given an integer x, return true if x is a palindrome, and false otherwise.
"""
#Python3 solution
class Solution:
    def isPalindrome(self, x: int) -> bool:
        list_x = list(str(x))
        for i in range(len(list_x)//2):
            if list_x[i] != list_x[-i-1]:
                return False
        return True