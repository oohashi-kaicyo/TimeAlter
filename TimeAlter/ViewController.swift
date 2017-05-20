//
//  ViewController.swift
//  TimeAlter
//
//  Created by oohashi on 2017/05/01.
//  Copyright © 2017年 oohashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let setting   = UserDefaults.standard
    @IBAction func didTapSetting(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "fromMainToSetting")
                       as! SettingViewController
        self.present(nextView, animated: true, completion: nil)
    }
    var timer: Timer!
    var wallpaper: Wallpaper = Wallpaper()
    var clock: AnalogClock   = AnalogClock()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(wallpaper)
        self.view.addSubview(self.clock)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        timer.fire()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        timer.invalidate()
    }
    func update(tm: Timer) {
        clock.updateHand()
    }
    override func viewDidAppear(_ animated: Bool) {
        func renewClock() {
            self.clock.removeFromSuperview()
            self.clock = AnalogClock()
            self.view.addSubview(self.clock)
        }
        func renewWallpaper() {
            self.wallpaper.removeFromSuperview()
            self.wallpaper = Wallpaper()
            self.view.addSubview(self.wallpaper)
        }
        renewWallpaper()
        renewClock()
    }
}
