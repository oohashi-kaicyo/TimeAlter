//
//  Time.swift
//  TimeAlter
//
//  Created by oohashi on 2017/05/01.
//  Copyright © 2017年 oohashi. All rights reserved.
//

import Foundation

/**
 * @brief 時を表現するクラス
 *
 * 1日を(1日 <= 24時間)として定義することを想定
 * 1時間は60分固定で，1分間に対する秒数を定義して調整
 *
 */
class Time {
    // @to-do 宣言同時初期化ではなく，イニシャライザで初期化することを検討
    private      let spd: Int = 24 * 60 * 60 ///< second per day
    public       let mph: Int = 60           ///< minute per hour
    private(set) var spm: Int = 60           ///< second per minute
    public       var hpd: Int = 24 {         ///< hour   per day
        didSet {
            self.spm = self.spd / (hpd * self.mph)
        }
    }
    init(hpd: Int) {
        if hpd < 24 {
            self.hpd = 24
        } else if hpd > 48 {
            self.hpd = 48
        } else {
            self.hpd =  hpd
        }
        self.spm = self.spd / (self.hpd * self.mph)
    }
    public func calcNowTime()->(Int, Int, Int) {
        func generateNowTimeBySeconds()->Int {
            let date = Date()
            let cal = Calendar.current
            var dataComps:DateComponents = cal.dateComponents([.hour, .minute, .second], from: date)
            let second:Int = (dataComps.hour!   * 60 * 60)
                           + (dataComps.minute! * 60     )
                           + (dataComps.second!          )
            return second
        }
        var second: Int = generateNowTimeBySeconds()
        var minute: Int = second / self.spm
        second         %= self.spm
        let   hour: Int = minute / self.mph
        minute         %= self.mph
        return (hour, minute, second)
    }
}
