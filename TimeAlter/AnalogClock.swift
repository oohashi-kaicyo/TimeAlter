//
//  AnalogClock.swift
//  TimeAlter
//
//  Created by oohashi on 2017/05/03.
//  Copyright © 2017年 oohashi. All rights reserved.
//

import Foundation
import UIKit

/**
 * @breif アナログ時計を表現するクラス
 */
class AnalogClock: UIView {
    let time: Time = Time(hpd: 24)
    let secondHand: SecondHand = SecondHand()
    init(width: Int) {
        var width = width
        if width > Screen.width {
            width = Screen.width
        }
        let xCentering: Int = Screen.width  / 2 - width / 2
        let yCentering: Int = Screen.height / 2 - width / 2
        super.init(frame: CGRect(x: xCentering, y: yCentering, width: width, height: width))
        self.addSubview(self.secondHand)
    }
    convenience init() {
        self.init(width: Screen.width)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /**
     * @brief 時計描画更新処理
     */
    func updateHand() {
        let en: Int = 360
        func updateHourHand(hour: Int) {
            // @to-do let hourHandAngle: Int   = en / self.time.hpd * hour
            // @to-do アニメーション
        }
        func updateMinuteHand(minute: Int) {
            // @to-do let minuteHandAngle: Int = en / self.time.mph * minute
            // @to-do アニメーション
        }
        func updateSecondHand(second: Int) {
            let secondHandAngle: CGFloat = CGFloat(en) - CGFloat(en / self.time.spm) * CGFloat(second)
            self.secondHand.routate(angle: secondHandAngle)
        }
        var hour:   Int;
        var minute: Int;
        var second: Int;
        (hour, minute,second) = self.time.calcNowTime()
        updateHourHand(hour: hour);
        updateMinuteHand(minute: minute)
        updateSecondHand(second: second)
        print("\(hour):\(minute):\(second)")
    }
}
