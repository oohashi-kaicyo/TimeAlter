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
    var wallpaperImage: UIImage {
        get {
             let wallpaper: NSData? = UserDefaults.standard.object(forKey: WallpaperConf.wallpaper.rawValue) as? NSData
            if (wallpaper == nil) {
                return UIImage(named: "white.png")!
            }
            return UIImage(data: wallpaper! as Data)!
        }
        set {
            Wallpaper.conf.set(newValue, forKey: WallpaperConf.wallpaper.rawValue)
            self.image = newValue
        }
    }
    func renew() {
        self.image = self.wallpaperImage
    }
}
