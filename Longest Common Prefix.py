"""
Write a function to find the longest common prefix string amongst an array of strings.
If there is no common prefix, return an empty string ""
"""
#Python3 solution
class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        strs.sort(key=lambda s: len(s))
        tmp_val = 0
        res = ''
        for index,value in enumerate(strs[0]):
            for y in strs[1:]:
                if value == y[index]:
                    tmp_val += 1
            if tmp_val != len(strs[1:]):
                return res
            res += value
            tmp_val = 0
        return res