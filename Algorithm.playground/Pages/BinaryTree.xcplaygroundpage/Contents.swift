//: [Previous](@previous)

import Foundation

//: 近日面试被问到二叉树的遍历，所以在这里写下二叉树遍历的思路。

//            A
//          /   \
//        B       C
//      /       /   \
//    D       E       F
//      \
//        G

//: 二叉链表存储结构

class BiTNode {
    var data: Any
    var lchild: BiTNode?
    var rchild: BiTNode?
    
    init(data: Any) {
        self.data = data
        lchild = nil
        rchild = nil
    }
}

func visit(bt: BiTNode?) {
    // *** customize
}

//: 先复习一下二叉树常用的遍历顺序，二叉树是有序的，即使将其左子树和右子树颠倒，那也是另一棵不同二叉树。即使树中只有一棵子树，也要区分它是左子树还是右子树。

//: 先序遍历

func btPreOrder(_ bt: BiTNode?) {
    guard let _ = bt else { return }
    visit(bt: bt)
    btPreOrder(bt?.lchild)
    btPreOrder(bt?.rchild)
}

// A B D G C E F

//: 中序遍历

func btInOrder(_ bt: BiTNode?) {
    guard let _ = bt else { return }
    btInOrder(bt?.lchild)
    visit(bt: bt)
    btInOrder(bt?.rchild)
}

// D G B A E C F

//: 后序遍历

func btPostOrder(_ bt: BiTNode?) {
    guard let _ = bt else { return }
    btPostOrder(bt?.lchild)
    btPostOrder(bt?.rchild)
    visit(bt: bt)
}

// G D B E F C A
//: [Next](@next)
