//: [Previous](@previous)

import Foundation

/*:
 > # No.1 在一个长度为 n 的数组里的所有数字都在 0~n-1 的范围内，找出数组中任意重复的数字.
 ---
 时间复杂度：O(n) 空间复杂度：O(1)
 */

func duplicate(arr: inout [Int]) -> (Bool, Int?) {
    guard arr.count != 0 else {
        return (false, nil)
    }
    for  i in 0..<arr.count {
        guard arr[i] >= 0 || arr[i] <= arr.count - 1 else {
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

/*:
 > # NO.2 在一个长度为 n+1 的数组里所有数字都在 1~n 的范围内，故数组中至少有一个数字是重复的。请找出数组中任意重复的数字，但不能修改输入的数组。
 ---
 
 思路1: arr2[arr[i]] = arr[i]   因为重新创建了arr2,空间复杂度为: O(n)
 
 思路2: 把 1~n 的数字从中间的数字 m 分为两部分，前半 1~m, 后半 m+1~n, 若前半数字的个数超过 m,说明前半一定包含重复数字，否则重复数字在后半，可以继续把这一半数字的区间一分为二，直到找到这个重复的数字。
 
 ---
 时间复杂度：O(nlogn) 空间复杂度：O(1)
 */

func getDuplication(arr: [Int]) -> Int {
    guard arr.count != 0 else {
        return -1
    }
    
    func countRange(arr: [Int], first: Int, last: Int)  -> Int {
        guard arr.count != 0 else {
            return 0
        }
        var count: Int = 0
        for i in 0..<arr.count {
            if arr[i] >= first && arr[i] <= last {
                count = count + 1
            }
        }
        return count
    }
    
    var first = 1
    var last = arr.count - 1
    while last >= first {
        let mid = (last - first) / 2 + first
        let count = countRange(arr: arr, first: first, last: mid)
        if last == first {
            if count > 1 {
                return first
            } else {
                break
            }
        }
        if count > mid - first + 1 {
            last = mid
        } else {
            first = mid + 1
        }
    }
    return -1
}

/*:
 > # 在一个二维数组中，每一行都按照从左至右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样一个二维数组和一个整数，判断数组中是否含有该整数。
 ---
 1 2 8 9
 2 4 9 12
 4 7 10 13
 6 8 11 15
 
 时间复杂度：<#O#> 空间复杂度：<#O#>
 */

func find(matrix: [[Int]], rows: Int, columns: Int,  number: Int) -> Bool {
    var isFound = false
    if matrix.count != 0 && rows > 0 && columns > 0 {
        var row = 0
        var column = columns - 1
        while row < rows && column >= 0 {
            if matrix[row][column] == number {
                isFound = true
                break
            } else if matrix[row][column] > number {
                column = column - 1
            } else {
                row = row + 1
            }
        }
    }
    return isFound
}

//let isFound = find(matrix: [[1, 2, 8, 9], [2, 4, 9, 12], [4, 7, 10, 13], [6, 8, 11, 15]], rows: 4, columns: 4, number: 7)



//: [Next](@next)
