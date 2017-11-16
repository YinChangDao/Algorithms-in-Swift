//: Playground - noun: a place where people can play

import Foundation

/*:
 > # No.3 在一个长度为 n 的数组里的所有数字都在 0~n-1 的范围内，找出数组中任意重复的数字.
 ---
 时间复杂度：O(n) 空间复杂度：O(1)
 */

func duplicate(arr: inout [Int]) -> (Bool, Int?) {
    guard arr.count != 0 else {
        return (false, nil)
    }
    for  i in 0..<arr.count {
        guard arr[i] > 0 || arr[i] <= arr.count - 1 else {
            return (false, nil)
        }
    }
    
    for i in 0..<arr.count {
        while arr[i] != i {
            if arr[i] == arr[arr[i]] {
                let duplicateNo = arr[i]
                return (true, duplicateNo)
            }
            let temp = arr[i]
            arr[i] = arr[temp]
            arr[temp] = temp
        }
    }
    return (false, nil)
}

var arr = [2, 3, 1, 0, 2, 5, 3]
duplicate(arr: &arr)





