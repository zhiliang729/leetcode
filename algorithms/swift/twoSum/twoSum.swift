// Source : https://oj.leetcode.com/problems/two-sum/
// Author : zhang liang
// Date   : 2019-03-29

/********************************************************************************** 
* 
* Given an array of integers, find two numbers such that they add up to a specific target number.
* 
* The function twoSum should return indices of the two numbers such that they add up to the target, 
* where index1 must be less than index2. Please note that your returned answers (both index1 and index2) 
* are not zero-based.
* 
* You may assume that each input would have exactly one solution.
* 
* Input: numbers={2, 7, 11, 15}, target=9
* Output: index1=1, index2=2
* 
*               
**********************************************************************************/

class Solution {
    /*
     *   The easy solution is O(n^2) run-time complexity.
     *   ```
     *       foreach(item1 in array) {
     *           foreach(item2 in array){
     *               if (item1 + item2 == target) {
     *                   return result
     *               }
     *           }
     *   ```
     *   
     *   We can see the nested loop just for searching, 
     *   So, we can use a hashmap to reduce the searching time complexity from O(n) to O(1)
     *   (the map's `key` is the number, the `value` is the position)
     *   
     *   But be careful, if there are duplication numbers in array, 
     *   how the map store the positions for all of same numbers?
     *
     */

    /// O(n^2)
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

        let count = nums.count
        for i in 0 ..< count - 1 {

            let num = nums[i]
            for j in (i+1) ..< count {
                if num + nums[j] == target {
                    return [i, j]
                }
            }
        }
        return []
    }

    /// O(1)
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

        var dict = [Int: Int]()
        for (i, num) in nums.enumerated() {

            if let lastIndex = dict[target - num] {
                return [lastIndex, i]
            }

            dict[num] = i
        }

        return []
    }
};
