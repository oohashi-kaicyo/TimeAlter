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
        case mode        = "mode"
        case opacity     = "opacity"
    }
    var wallpaperImage: UIImage {
        get {
            if let wallpaper: Data = UserDefaults.standard.data(forKey: WallpaperConf.wallpaper.rawValue) {
                return UIImage(data: wallpaper)!
            }
            return UIImage(named: "white.png")!
        }
        set {
            Wallpaper.conf.set(UIImagePNGRepresentation(newValue), forKey: WallpaperConf.wallpaper.rawValue)
            self.image = newValue
        }
    }
    var wallpaperContentsMode: UIViewContentMode {
        get {
            if let mode: String = Wallpaper.conf.string(forKey: WallpaperConf.mode.rawValue) {
                switch mode {
                case "scaleAspectFit":
                    return .scaleAspectFit
                case "scaleAspectFill":
                     return .scaleAspectFill
                default: break
                }
            }
            return .scaleAspectFit
        }
        set {
            switch newValue {
            case .scaleAspectFit:
                Wallpaper.conf.set("scaleAspectFit", forKey: WallpaperConf.mode.rawValue)
            case .scaleAspectFill:
                Wallpaper.conf.set("scaleAspectFill", forKey: WallpaperConf.mode.rawValue)
            default: break
            }
            self.contentMode = newValue
        }
    }
    var opacity: Float {
        get {
            var opacity: Float = Wallpaper.conf.float(forKey: WallpaperConf.opacity.rawValue)
            if opacity == 0.0 {
               opacity = 1.0
            }
            return Float(opacity)
        }
        set {
            Wallpaper.conf.set(newValue, forKey: WallpaperConf.opacity.rawValue)
            self.alpha = CGFloat(opacity)
        }
    }
    func renew() {
        self.image = self.wallpaperImage
        self.contentMode = wallpaperContentsMode
    }
}
