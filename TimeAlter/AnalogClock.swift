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
    var time: Time
    var dial: Dial
    var hourHand:   HourHand
    var minuteHand: MinuteHand
    var secondHand: SecondHand
    init(width: Int, hpd: Int) {
        var width = width
        if width > Screen.width {
            width = Screen.width
        }
        time = Time(hpd: hpd)
        self.dial       = Dial(width: width, hpd: time.hpd)
        self.hourHand   = HourHand(width: width)
        self.minuteHand = MinuteHand(width: width)
        self.secondHand = SecondHand(width: width)
        let xCentering: Int = Screen.width  / 2 - width / 2
        let yCentering: Int = Screen.height / 2 - width / 2
        super.init(frame: CGRect(x: xCentering, y: yCentering, width: width, height: width))
        self.addSubview(self.dial)
        self.addSubview(self.hourHand)
        self.addSubview(self.minuteHand)
        self.addSubview(self.secondHand)
    }
    convenience init(hpd: Int) {
        self.init(width: Screen.width, hpd: hpd)
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
            let hourHandAngle: Double = Double(en) / Double(self.time.hpd) * Double(hour)
            self.hourHand.routate(angle: CGFloat((hourHandAngle * .pi) / 180.0))
        }
        func updateMinuteHand(minute: Int) {
            let minuteHandAngle: Double = Double(en) / Double(self.time.mph) * Double(minute)
            self.minuteHand.routate(angle: CGFloat((minuteHandAngle * .pi) / 180.0))

        }
        func updateSecondHand(second: Int) {
            let secondHandAngle: Double = Double(en) / Double(self.time.spm) * Double(second)
            self.secondHand.routate(angle: CGFloat((secondHandAngle * .pi) / 180.0))
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
