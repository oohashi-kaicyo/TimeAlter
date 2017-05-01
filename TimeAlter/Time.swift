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
    private static let spd: Int = 24 * 60 * 60 ///< second per day
    private(set)   var mph: Int = 60           ///< minute per hour
    private(set)   var spm: Int = 60           ///< second per minute
    public         var hpd: Int = 24 {         ///< hour   per day
        didSet {
            self.spm = Time.spd / (hpd * self.mph)
        }
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
    init(hpd: Int) {
        if hpd < 24 || hpd > 48 {
            // @to-do 入力値エラー
            return
        }
        self.hpd =  hpd
        self.spm = Time.spd / (self.hpd * self.mph)
    }
}
