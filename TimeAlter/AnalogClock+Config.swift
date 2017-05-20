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
    /**
     * @brief AnalogClockクラスの為の，値保持用のシングルトンクラス
     */
    class ClockConfigSingleton {
        let conf = UserDefaults.standard
        enum Conf: String {
            case hpd   = "hpd"
            case theme = "theme"
        }
        var hpd: Int {
            get {
                var hpd: Int? = conf.integer(forKey: Conf.hpd.rawValue)
                if(hpd == nil) {
                    hpd = 24;
                    conf.set(hpd, forKey: Conf.hpd.rawValue)
                }
                return hpd!
            }
            set {
                self.conf.set(newValue, forKey: Conf.hpd.rawValue)
            }
        }
        enum Theme: String {
            case white   = "white"
            case monokai = "monokai"
        }
        var theme: Theme {
            get {
                var theme: String? = conf.object(forKey: Conf.theme.rawValue) as? String
                if(theme == nil) {
                    LOG()
                    theme = Theme.white.rawValue;
                    conf.set(theme, forKey: Conf.theme.rawValue)
                }
                return AnalogClock.ClockConfigSingleton.Theme(rawValue: theme!)!
            }
            set {
                self.conf.set(newValue.rawValue, forKey: Conf.theme.rawValue)
            }
        }
        var bgColor: UIColor {
            switch AnalogClock.conf.theme {
            case .white:
                return .white
            case .monokai:
                return .black
            }
        }
        var fgColor: UIColor {
            switch AnalogClock.conf.theme {
            case .white:
                return .black
            case .monokai:
                return .white
            }
        }
        static let sharedInstance = ClockConfigSingleton()
    }
    static var conf: ClockConfigSingleton {
        get {
            return ClockConfigSingleton.sharedInstance
        }
    }
}
