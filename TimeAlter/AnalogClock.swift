//
//  AnalogClock.swift
//  TimeAlter
//
//  Created by oohashi on 2017/05/03.
//  Copyright © 2017年 oohashi. All rights reserved.
//

import Foundation
import UIKit
struct screen {
//    screenSize: Size = UIScreen.mainScreen().bounds
}
class AnalogClock: UIView {
    init() {
        // 本体AnalogClockの大きさは?
        // 位置は中心に設置?
//         UIScreen.mainScreen().bounds
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    }
    init(width witdh: Int) {
        // もしスマホより大きければ，小さくして表示
        super.init(frame: CGRect(x: 0, y: 0, width: witdh, height: witdh))
        //        self.transform = self.transform.rotated(by: rotate.rotation)
    }
    // イニシャライザにアクセスできないようにしたい
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
