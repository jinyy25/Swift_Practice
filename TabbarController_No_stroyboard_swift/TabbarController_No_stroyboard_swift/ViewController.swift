//
//  ViewController.swift
//  TabbarController_No_stroyboard_swift
//
//  Created by 윤진영 on 2022/07/11.
//

import UIKit

class MyViewController: UIViewController {

    convenience init(title: String, bgColor: UIColor) {
        self.init()
        self.title = title
        self.view.backgroundColor = bgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

