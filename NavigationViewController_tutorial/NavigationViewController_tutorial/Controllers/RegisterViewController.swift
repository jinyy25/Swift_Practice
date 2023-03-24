//
//  RegisterViewController.swift
//  NavigationViewController_tutorial
//
//  Created by 윤진영 on 2022/05/05.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var btnForLoginViewController: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.isNavigationBarHidden = true
    }
    @IBAction func onLoginViewControllerBtnClicked(_ sender: UIButton) {
        print("RegisterViewController - onLoginViewControllerBtnClicked() called Login Btn")
        // 네비게이션 뷰 컨트롤러 팝
        self.navigationController?.popViewController(animated:true)
    }
    

}
