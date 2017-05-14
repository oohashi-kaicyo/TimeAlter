//
//  Dial.swift
//  TimeAlter
//
//  Created by oohashi on 2017/05/03.
//  Copyright © 2017年 oohashi. All rights reserved.
//

import Foundation
import UIKit

/**
 * @brief 文字盤を表現するクラス
 */
class Dial: UIView {
    init(width: Int, hpd: Int) {
        var width = width
        if width > Screen.width {
            width = Screen.width
        }
        super.init(frame: CGRect(x: 0, y: 0, width: width, height: width))
        for num in 1...hpd {
            let numeral: Numeral = Numeral(width: width, hpd: hpd, numeral: num, fontColor: AnalogClock.conf.fgColor)
            self.addSubview(numeral)
        }
        self.backgroundColor = AnalogClock.conf.bgColor
    }
    convenience init(hpd: Int) {
        self.init(width: Screen.width, hpd: hpd)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
