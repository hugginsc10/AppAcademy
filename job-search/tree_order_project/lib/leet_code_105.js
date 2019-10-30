// View the full problem and run the test cases at:
//  https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/

const { TreeNode } = require('./tree_node.js');


function buildTree(preorder, inorder) {
  if (preorder.length === 0) {
    return null;

  }
  if (preorder.length === 1) {
    return new TreeNode(preorder[0])
  }
  const rootVal = preorder[0];
  const root = new TreeNode(rootVal);
  const idx = inorder.indexOf(rootval);

  root.left = buildTree(preorder.slice(1, idx + 1), inorder.slice(0, idx));
  root.right = buildTree(preorder.slice(1 + idx), inorder.slice(1 + idx))
  return root
}
