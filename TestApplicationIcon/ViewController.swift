//
//  ViewController.swift
//  TestApplicationIcon
//
//  Created by Xinxibin on 2017/5/9.
//  Copyright © 2017年 Xinxibin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var images = ["Icon1","Icon2","Icon-60"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func onBtnClick(_ sender: UIButton) {
        
        setIconName(icon: images[sender.tag - 1])
    }
    

    func setIconName(icon:String) {
        
        let app = UIApplication.shared
        if app.supportsAlternateIcons {
            app.setAlternateIconName(icon, completionHandler: { (error) in
                if error != nil {
                    print("error => \(String(describing: error?.localizedDescription))")
                }else {
                    print("Done")
                }
            })
        }
    }

}

