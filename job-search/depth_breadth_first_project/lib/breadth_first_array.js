function breadthFirstArray(root) {
    let queue = [];
    let pastNodes = [ root ];
    while (pastNodes.length){
        let lastNode = pastNodes.shift();

        queue.push(lastNode.val);

        if (lastNode.left){
            pastNodes.push(lastNode.left);
        }
        if (lastNode.right){
            pastNodes.push(lastNode.right);
        }
    }

    return queue;
}

module.exports = {
    breadthFirstArray
};