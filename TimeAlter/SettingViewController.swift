//
//  SettingViewController.swift
//  TimeAlter
//
//  Created by oohashi on 2017/05/08.
//  Copyright © 2017年 oohashi. All rights reserved.
//

import Foundation
//
//  ViewController.swift
//  TimeAlter
//
//  Created by oohashi on 2017/05/01.
//  Copyright © 2017年 oohashi. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    let setting = UserDefaults.standard
    @IBOutlet weak var hpdLabel: UILabel!
    @IBOutlet weak var hpdSlider: UISlider!
    @IBAction func didTapClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func didChangeSlider(_ sender: UISlider) {
        let hpd: Int = Int(sender.value + 0.5)
        self.hpdLabel.text = "\(hpd)時間 / 日"
        AnalogClock.conf.hpd = hpd
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let hpd = AnalogClock.conf.hpd
        self.hpdLabel.text   = "\(hpd)時間 / 日";
        self.hpdSlider.value = Float(hpd);
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
}
