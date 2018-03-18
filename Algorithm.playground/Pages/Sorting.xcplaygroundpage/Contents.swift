//: [Previous](@previous)

import Foundation

//: 插入排序  O(n^2)
// 每次将一个待排序的记录按其关键字大小插入到它前面已经排好序的子表的适当位置，直到全部记录插入完成，整个表有序为止。

func dirInsertSort(arr: [Int]) -> [Int] {
    var array = arr
    guard array.count > 1 else { return array }
    for i in 1..<array.count {
        if array[i] < array[i - 1] {
            let post = array[i]
            var j = i - 1
            while j >= 0 && post < array[j] {
                array[j + 1] = array[j]
                j = j - 1
            }
            if j < 0 {
                j = 0
            }
            array[j] = post
        }
    }
    return array
}

var arr: [Int] = [36, 24, 12, 3, 56]

dirInsertSort(arr: arr)

//: 折半插入排序 O(n^2)
func halfInsertSort(arr: [Int]) -> [Int] {
    var array = arr
    guard array.count > 1 else { return array }
    for i in 1..<array.count {
        let post = arr[i]
        var low = 0
        var high = i - 1
        while low <= high {
            let mid = (low + high) / 2
            if post >= array[mid] {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        var j = i - 1
        while j >= high + 1 {
            array[j + 1] = array[j]
            j = j - 1
        }
        array[high + 1] = post
    }
    return array
}

halfInsertSort(arr: arr)

//: 冒泡排序  O(n^2)
func bubbleSort(arr: [Int]) -> [Int] {
    var array = arr
    var isSwaped: Bool
    for i in 0..<array.count - 1 {        // count - 1 趟
        isSwaped = false
        for j in 0..<array.count - 1 - i {
            if array[j] > array[j + 1] {
                let temp = array[j + 1]
                array[j + 1] = array[j]
                array[j] = temp
                isSwaped = true
            }
        }
        if !isSwaped {
            break
        }
    }
    return array
}

bubbleSort(arr: arr)

//: 快速排序，快排的核心操作是划分。

func partition(arr: inout [Int], l: Int, h: Int) -> Int {
    var low = l, high = h
    let post = arr[low]
    while low < high {
        while low < high && arr[high] >= post {
            high = high - 1
        }
        if low < high {
            arr[low] = arr[high]
            low = low + 1
        }
        while low < high && arr[low] < post {
            low = low + 1
        }
        if low < high {
            arr[high] = arr[low]
            high = high - 1
        }
        arr[low] = post
    }
    return low
}

func quickSort(arr: inout [Int], s: Int, t: Int) {
    if s < t {
        let i = partition(arr: &arr, l: s, h: t)
        quickSort(arr: &arr, s: s, t: i - 1)
        quickSort(arr: &arr, s: i + 1, t: t)
    }
}

quickSort(arr: &arr, s: 0, t: arr.count - 1)
//: [Next](@next)
