//
//  ViewController.swift
//  TimeAlter
//
//  Created by oohashi on 2017/05/01.
//  Copyright © 2017年 oohashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer: Timer!
    var wallpaper: Wallpaper = Wallpaper()
    var clock: AnalogClock   = AnalogClock()
    @IBOutlet weak var bar: UIToolbar!
    @IBAction func goToConf(_ sender: Any) {
        func screenTransition() {
            let storyboard: UIStoryboard = self.storyboard!
            let nextView = storyboard.instantiateViewController(withIdentifier: "fromMainToSetting")
                as! SettingViewController
            nextView.wallpaper = self.wallpaper
            self.present(nextView, animated: true, completion: nil)
        }
        screenTransition()
    }
    func viewTapped() {
        if self.bar.isHidden {
            self.bar.isHidden = false
            return
        }
        self.bar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.insertSubview(self.wallpaper, aboveSubview: self.view)
        self.view.addSubview(self.clock)
        self.view.bringSubview(toFront: self.bar)
        func barHiddenSetting() {
            self.view.isUserInteractionEnabled = true
            self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.viewTapped)))
        }
        barHiddenSetting()
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
        self.clock.renew()
        self.wallpaper.renew()
    }
    
}
