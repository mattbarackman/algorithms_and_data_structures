function BinaryTreeNode(value, parent, left, right) {
  this.value = value || null;
  this.left = left || null;
  this.right = right || null;
  this.parent = parent || null;
}

function BinaryTree(root_node) {
  this.root_node = root_node;
}

BinaryTree.prototype.insert = function(value, current_node) {
  current_node = current_node || this.root_node;
  if (value < current_node.value) {
    if (current_node.left === null) {
      current_node.left = new BinaryTreeNode(value, current_node);
      return current_node.left;
    }
    return this.insert(value, current_node.left);
  } else {
    if (current_node.right === null) {
      current_node.right = new BinaryTreeNode(value, current_node);
      return current_node.right;
    }
    return this.insert(value, current_node.right);
  }
};

BinaryTree.prototype.search = function(value, current_node) {
  if (current_node === null) {
    return null;
  }
  current_node = current_node || this.root_node;
  if (value == current_node.value) {
    return current_node;
  } else if (value < current_node.value) {
    return this.search(value, current_node.left);
  } else {
    return this.search(value, current_node.right);
  }
};

var root = new BinaryTreeNode(5);

var binaryTree = new BinaryTree(root);

binaryTree.insert(4);
binaryTree.insert(1);

assert(binaryTree.search(1).value === 1, "binaryTree#search(1) returns node 1");
assert(binaryTree.search(4).value === 4, "binaryTree#search(4) returns node 4");
assert(binaryTree.search(5).value === 5, "binaryTree#search(5) returns node 5");
assert(binaryTree.search(2) === null, "binaryTree#search(2) returns null");
