//
//  Wallper+Config.swift
//  TimeAlter
//
//  Created by oohashi on 2017/05/20.
//  Copyright © 2017年 oohashi. All rights reserved.
//

import Foundation
import UIKit

extension Wallpaper {
    static let conf = UserDefaults.standard
    enum WallpaperConf: String {
        case wallpaper   = "wallpaper"
        case color       = "color"
        case isEnable    = "isEnable"
    }
    var imagePath: String {
        get {
            let wallpaper: String? = Wallpaper.conf.string(forKey: WallpaperConf.wallpaper.rawValue)
            if (wallpaper == nil) {
                return "white.png"
            }
            return wallpaper!
        }
        set {
            Wallpaper.conf.set(newValue, forKey: WallpaperConf.wallpaper.rawValue)
            self.image = UIImage(named: newValue)
        }
    }
}
