/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var p_ancestors = [TreeNode?]()
        var cur = root

        while cur!.val != p!.val {
            p_ancestors.append(cur)
            if cur!.val < p!.val {
                cur = cur?.right
            }
            else {
                cur = cur?.left
            }
        }
        p_ancestors.append(p)

        var q_ancestors = [TreeNode?]()
        cur = root
          while cur!.val != q!.val {
            q_ancestors.append(cur)
            if cur!.val < q!.val {
                cur = cur?.right
            }
            else {
                cur = cur?.left
            }
        }
        q_ancestors.append(q)

        var index = 0
        while (index < p_ancestors.count) && (index < q_ancestors.count) {
            if p_ancestors[index] === q_ancestors[index] {
                index += 1
            }
            else {
                break
            }
        }
        
        return p_ancestors[index-1]
    }
}
