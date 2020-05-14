// Source : https://oj.leetcode.com/problems/add-two-numbers/
// Author : zhiliang729
// Date   : 2020-05-14

/********************************************************************************** 
* 
* You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
*
* You may assume the two numbers do not contain any leading zero, except the number 0 itself.
*
*   Example:
*
*       Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
*       Output: 7 -> 0 -> 8
*       Explanation: 342 + 465 = 807.
*               
**********************************************************************************/

/**
* Definition for singly-linked list.
* public class ListNode {
*     public var val: Int
*     public var next: ListNode?
*     public init(_ val: Int) {
*         self.val = val
*         self.next = nil
*     }
* }
*/
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var head: ListNode?
        var curNode: ListNode?
        
        var carry: Int = 0
        var curl1 = l1
        var curl2 = l2
        
        let appendNode: (ListNode) -> Void = { (node) in
            if head == nil {
                head = node
                curNode = node
            } else {
                curNode!.next = node
                curNode = node
            }
        }
        
        let handleBitAddResult: (Int) -> Void = { res in
            let nv = res % 10
            carry = res / 10
            
            appendNode(ListNode(nv))
        }
        
        while curl1 != nil || curl2 != nil {
            defer {
                curl1 = curl1?.next
                curl2 = curl2?.next
            }
            
            if let c1 = curl1 {
                if let c2 = curl2 {
                    handleBitAddResult(c1.val + c2.val + carry)
                } else {
                    handleBitAddResult(c1.val + carry)
                }
            } else if let c2 = curl2 {
                handleBitAddResult(c2.val + carry)
            }
        }
        
        if carry != 0 {
            appendNode(ListNode(carry))
        }
        return head
    }
}
