//
//  Wallpaer.swift
//  TimeAlter
//
//  Created by oohashi on 2017/05/20.
//  Copyright © 2017年 oohashi. All rights reserved.
//

import Foundation
import UIKit

class Wallpaper: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentMode = .scaleAspectFit
        self.image = self.wallpaperImage
        self.renew()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: Screen.width, height: Screen.height))
    }
}
