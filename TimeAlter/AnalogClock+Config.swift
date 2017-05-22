//
//  ClockConfig.swift
//  TimeAlter
//
//  Created by oohashi on 2017/05/14.
//  Copyright © 2017年 oohashi. All rights reserved.
//

import Foundation
import UIKit

extension AnalogClock {
    static let conf = UserDefaults.standard
    enum Conf: String {
        case hpd   = "hpd"
        case theme = "theme"
    }
    var hpd: Int {
        get {
            var hpd: Int = AnalogClock.conf.integer(forKey: Conf.hpd.rawValue)
            if(hpd == 0) {
                hpd = 24;
                AnalogClock.conf.set(hpd, forKey: Conf.hpd.rawValue)
            }
            return hpd
        }
        set {
            AnalogClock.conf.set(newValue, forKey: Conf.hpd.rawValue)
        }
    }
    enum Theme: String {
        case white   = "white"
        case monokai = "monokai"
    }
    var theme: Theme {
        get {
            var theme: String? = AnalogClock.conf.object(forKey: Conf.theme.rawValue) as? String
            if(theme == nil) {
                theme = Theme.white.rawValue;
                AnalogClock.conf.set(theme, forKey: Conf.theme.rawValue)
            }
            return AnalogClock.Theme(rawValue: theme!)!
        }
        set {
            AnalogClock.conf.set(newValue.rawValue, forKey: Conf.theme.rawValue)
        }
    }
    var bgColor: UIColor {
        switch self.theme {
        case .white:
            return .clear
        case .monokai:
            return .clear
        }
    }
    var fgColor: UIColor {
        switch self.theme {
        case .white:
            return .black
        case .monokai:
            return .white
        }
    }
    func renew() {
        func renewHandColor() {
            self.hourHand.changeHand(color: .black)
            self.minuteHand.changeHand(color: .black)
            self.secondHand.changeHand(color: .black)
        }
        func renewDialColor() {
            self.dial.generateDialNumber(color: self.fgColor)
        }
        func renewTime() {
            self.time.hpd = self.hpd
            self.dial.hpd = self.hpd
        }
        renewTime()
        renewHandColor()
        renewDialColor()
    }
}
