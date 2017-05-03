//
//  Clock.swift
//  TimeAlter
//
//  Created by oohashi on 2017/05/03.
//  Copyright © 2017年 oohashi. All rights reserved.
//

import Foundation
import UIKit

/**
 * @brief アナログ時計を表現するクラス
 */
class AnalogClock: UIView {
    public var testView: UIView
    // (private: Dial:  UIview)// 大きさを指定addする時の表示位置はどのようにして設定?
    // (private: Hand:  UIview)// 大きさを指定
    // private dial: Dial
    // private hourHand: Hand
    // private minuteHand: Hand
    // private secondHand: Hand
    override init(frame: CGRect) {
        testView = UIView(frame: frame)
        super.init(frame: frame)
        self.testView.backgroundColor = UIColor.blue
        self.addSubview(self.testView)
        self.testView.transform = self.testView.transform.rotated(by: 45)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
