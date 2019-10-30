function treeSum(root) {
    if (!root) return 0;

    return treeSum(root.right) + root.val + treeSum(root.left);
}


module.exports = {
    treeSum
};