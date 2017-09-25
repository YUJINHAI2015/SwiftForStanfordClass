//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by 余锦海 on 2017/9/25.
//  Copyright © 2017年 yujinhai. All rights reserved.
//

import Foundation
/*
 类：可以扩展、继承
 存在堆中，通过指针引用
 
 struct:
 存在栈中，通过拷贝“写时复制”
 会自动提供一个构造器，初始化属性
 */

// 点开assistant editor  按住alt + 点击需要打开的文件

struct CalculatorBrain {
    
    private var accumulator: Double? // 不需要赋值，struct会有一个自动的构造器,这里用可选值，是因为不想初始值里面用数据
    
//    mutating func performOperation(_ symbol: String) {
//        switch symbol{
//        case "𝞹":
//            accumulator = Double.pi // 修改私有变量也要用mutating
//        case "√":
//            if let operand = accumulator {
//                accumulator = sqrt(operand)
//            }
//        default:
//            break
//        }
//    }
    private enum Operation {
        case constant // 常量
        case unaryOperation // 函数
    }
    // 字典里面如何放两种类型参数呢？用enum
    private var operations: Dictionary<String,Operation> = [
        "𝞹" : Operation.constant, //Double.pi,
        "e" : Operation.constant, //M_E,
        "√" : Operation.unaryOperation, // sqrt
        "cos" : Operation.unaryOperation // cos
    ]
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {

        }
    }
    // 因为struct是通过拷贝传值的，如果要改变他的变量，要显示的告诉他，添加mutating.
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    var result: Double? {
        get {
            return accumulator // 可选值
            
        }
    }
    
}
