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
    var wallpaper: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: Screen.width, height: Screen.height))
    var clock: AnalogClock = AnalogClock(width: Screen.width, hpd: 24)
    override func viewDidLoad() {
        super.viewDidLoad()
        // @to-do 壁紙機能
        // wallpaper.image = UIImage(named: "yuunaCheer.jpg")
        // wallpaper.contentMode = .scaleAspectFit
        // self.view.addSubview(wallpaper)
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
        self.clock.removeFromSuperview()
        self.clock = AnalogClock(width: Screen.width, hpd: AnalogClock.conf.hpd)
        self.view.addSubview(self.clock)
    }
}
