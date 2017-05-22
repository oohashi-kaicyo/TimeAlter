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
    var hpd:    Int
    var width:  Int
    var height: Int
    func generateDialNumber(color: UIColor) {
        func removeAllSubviews(parentView: UIView) {
            let subviews = parentView.subviews
            for subview in subviews {
                subview.removeFromSuperview()
            }
        }
        removeAllSubviews(parentView: self)
        func generateRing() {
            let ring = Ring()
            self.addSubview(ring)
        }
        generateRing()
        for num in 1...hpd {
            let numeral: Numeral = Numeral(width: self.width, hpd: self.hpd, numeral: num, fontColor: color)
            self.insertSubview(numeral, aboveSubview: self)
        }
    }
    init(width: Int, hpd: Int) {
        var width = width
        if width > Screen.width {
            width = Screen.width
        }
        self.hpd = hpd
        self.width = width
        self.height = width
        super.init(frame: CGRect(x: 0, y: 0, width: width, height: width))
        generateDialNumber(color: .black)
    }
    convenience init(hpd: Int) {
        self.init(width: Screen.width, hpd: hpd)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
