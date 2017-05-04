//
//  AnalogClock.swift
//  TimeAlter
//
//  Created by oohashi on 2017/05/03.
//  Copyright © 2017年 oohashi. All rights reserved.
//

import Foundation
import UIKit

class AnalogClock: UIView {
    init(width: Int) {
        var width = width
        if width > Screen.width {
            width = Screen.width
        }
        let xCentering: Int = Screen.width  / 2 - width / 2
        let yCentering: Int = Screen.height / 2 - width / 2
        super.init(frame: CGRect(x: xCentering, y: yCentering, width: width, height: width))
    }
    convenience init() {
        self.init(width: Screen.width)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
