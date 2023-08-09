"""
Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
For example, 2 is written as II in Roman numeral, just two ones added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.
Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:
I can be placed before V (5) and X (10) to make 4 and 9.
X can be placed before L (50) and C (100) to make 40 and 90.
C can be placed before D (500) and M (1000) to make 400 and 900.
Given a roman numeral, convert it to an integer.
"""
#Python3 solution
class Solution:
    def romanToInt(self, s: str) -> int:
        res = 0
        res_dict = {
            'M':1000,
            'D':500,
            'C':100,
            'L':50,
            'X':10,
            'V':5,
            'I':1
        }
        if s.find('CM') != -1:
            s = s.replace('CM','')
            res += 900
        if s.find('CD') != -1:
            s = s.replace('CD','')
            res += 400
        if s.find('XC') != -1:
            s = s.replace('XC','')
            res += 90
        if s.find('XL') != -1:
            s = s.replace('XL','')
            res += 40
        if s.find('IX') != -1:
            s = s.replace('IX','')
            res += 9
        if s.find('IV') != -1:
            s = s.replace('IV','')
            res += 4
        for i in s:
            res += res_dict[i]
        return res