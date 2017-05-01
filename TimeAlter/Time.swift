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
    public  static let mph: Int = 60           ///< minute per hour
    private static let spd: Int = 24 * 60 * 60 ///< second per day
    private(set)   var spm: Int = 60           ///< second per minute
    public         var hpd: Int = 24 {         ///< hour   per day
        didSet {
            self.spm = Time.spd / (hpd * Time.mph)
        }
    }
    init(hpd: Int) {
        if hpd < 24 || hpd > 48 {
            return
        }
        self.hpd =  hpd
        self.spm = Time.spd / (self.hpd * Time.mph)
    }
}
