//
//  MacroLike.swift
//  TimeAlter
//
//  Created by oohashi on 2017/05/04.
//  Copyright © 2017年 oohashi. All rights reserved.
//

import Foundation
import UIKit

public func LOG(_ message: String = "", _ functionName: String = #function, _ line: Int = #line)
{
    #if DEBUG
        print("[\(functionName):\(line)] \(message)")
    #endif
}
public class Screen {
    public static let width:  Int =  Int(UIScreen.main.bounds.size.width)
    public static let height: Int =  Int(UIScreen.main.bounds.size.height)
}
