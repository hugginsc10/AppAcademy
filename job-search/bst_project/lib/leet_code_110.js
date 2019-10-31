// View the full problem and run the test cases at:
//  https://leetcode.com/problems/balanced-binary-tree/

function maxHeight(root) {
  if (!root) return -1;
  return Math.max(maxHeight(root.left), maxHeight(root.right)) + 1;
}

var isBalanced = function (root) {
  if (!root) return true;

  let leftHeight = maxHeight(root.left)
  let rightHeight = maxHeight(root.right)

  let diff = Math.abs(leftHeight - rightHeight) <= 1;
  return diff && isBalanced(root.left) && isBalanced(root.right);
};