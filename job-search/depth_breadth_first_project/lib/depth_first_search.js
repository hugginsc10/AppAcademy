function depthFirstSearch(root, targetVal) {
    let stack = [root];

    while (stack.length){
        const lastEle = stack.pop();
        if (lastEle.val === targetVal){
            return lastEle;
        } 
        if (lastEle.right) {
            stack.push(lastEle.right)
        }
        if (lastEle.left) {
            stack.push(lastEle.left);
        }
        
    }
    return null;
}


module.exports = {
    depthFirstSearch
};