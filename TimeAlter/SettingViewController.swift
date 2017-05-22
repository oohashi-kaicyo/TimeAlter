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

class SettingViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var clock: AnalogClock   = AnalogClock()
    var wallpaper: Wallpaper = Wallpaper()
    @IBOutlet weak var wallpaperIsFitSwitch: UISwitch!
    @IBOutlet weak var hpdLabel: UILabel!
    @IBOutlet weak var hpdSlider: UISlider!
    @IBOutlet weak var opacitySlider: UISlider!
    @IBOutlet weak var darkThemeButton: UISwitch!
    @IBAction func didClickcameraRollButton(_ sender: Any) {
        pickImageFromLibrary()
    }
    @IBAction func didChangeDarkThemeButton(_ sender: Any) {
        if ( (sender as AnyObject).isOn ) {
            clock.theme = .monokai
            return
        }
        clock.theme = .white
    }
    @IBAction func didChangeWallpaperIsFitSwitch(_ sender: Any) {
        if ( (sender as AnyObject).isOn ) {
            self.wallpaper.wallpaperContentsMode = .scaleAspectFit
            return
        }
        self.wallpaper.wallpaperContentsMode = .scaleAspectFill
    }
    @IBAction func didTapClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func didChangeSlider(_ sender: UISlider) {
        let hpd: Int = Int(sender.value + 0.5)
        self.hpdLabel.text = "\(hpd)時間 / 日"
        clock.hpd = hpd
    }
    @IBAction func didChangeOpacitySlider(_ sender: Any) {
        self.wallpaper.opacity = (sender as AnyObject).value
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let hpd                        = clock.hpd
        self.hpdLabel.text             = "\(hpd)時間 / 日";
        self.hpdSlider.value           = Float(hpd);
        self.darkThemeButton.isOn      = self.clock.theme                     == .monokai        ? true : false
        self.wallpaperIsFitSwitch.isOn = self.wallpaper.wallpaperContentsMode == .scaleAspectFit ? true : false
        self.opacitySlider.value       = self.wallpaper.opacity
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    func pickImageFromLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let controller = UIImagePickerController()
            controller.delegate = self
            controller.sourceType = UIImagePickerControllerSourceType.photoLibrary
            self.present(controller, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        func saveImage() {
            if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
                wallpaper.wallpaperImage = image
            }
        }
        saveImage()
    }
}
