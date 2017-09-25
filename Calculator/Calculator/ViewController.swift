//
//  ViewController.swift
//  Calculator
//
//  Created by 余锦海 on 2017/9/24.
//  Copyright © 2017年 yujinhai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel! // 可选值属性可以不给显式的赋值，因为可选值的缺省值是nil
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            // 其他次进入
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            // 第一次进入
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
        
        // let and var 区别
        // 一般上不需要赋值的建议使用let,代表常量。
        // 像数组，swift传递数组没有传递指针的概念，都是通过拷贝传递，使用let数组，swift有一套自己的拷贝机制，并不会每次都拷贝，只有在赋值的时候才会拷贝。而如果是使用var数组，swift则每次传递都会拷贝。
        
        // optional --- {nil, value}
        // ! 加上！ 就是隐式解析 --- value (隐式解析得到可选类型里面的值，注意如果可选类型是nil,就会奔溃)
    }
    // 计算型属性 属性转换
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    // 把计算模块逻辑放到model层
    private var brain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {

        // 放操作数
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        // 放操作符 +/*\
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        // 返回结果 可选类型
        if let result = brain.result {
            displayValue = result
        }
    }
}

