//
//  ClockConfig.swift
//  TimeAlter
//
//  Created by oohashi on 2017/05/14.
//  Copyright © 2017年 oohashi. All rights reserved.
//

import Foundation

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
        enum Theme {
            case white
            case monokai
        }
        var theme: Theme {
            get {
                var theme: Theme? = (conf.object(forKey: Conf.theme.rawValue) as! AnalogClock.ClockConfigSingleton.Theme)
                if(theme == nil) {
                    theme = Theme.monokai;
                    conf.set(theme, forKey: Conf.theme.rawValue)
                }
                return theme!
            }
            set {
                self.conf.set(newValue, forKey: Conf.theme.rawValue)
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
