//
//  MacroLike.swift
//  TimeAlter
//
//  Created by oohashi on 2017/05/04.
//  Copyright © 2017年 oohashi. All rights reserved.
//

import Foundation
import UIKit

/**
 * @brief ログを出力する関数
 *
 * @param message(String): 出力したいメッセージ
 * 関数名, 行数, メッセージの順で出力
 */
public func LOG(_ message: String = "", _ functionName: String = #function, _ line: Int = #line) {
    #if DEBUG
        print("[\(functionName):\(line)] \(message)")
    #endif
}
/**
 * @brief インスタンスの番地を出力する関数
 */
public func printAdress(_ obj: AnyObject) {
    #if DEBUG
    print(Unmanaged.passUnretained(obj).toOpaque())
    #endif
}
/**
 * @brief 画面サイズを扱う構造体
 *
 * @param width(Int): 画面の横サイズ
 * @param height(Int): 画面の縦サイズ
 */
public struct Screen {
    public static let width:  Int =  Int(UIScreen.main.bounds.size.width)
    public static let height: Int =  Int(UIScreen.main.bounds.size.height)
}

