//
//  ViewController.swift
//  CompletionBlock-Tutorial
//
//  Created by 윤진영 on 2022/06/20.
//

import UIKit
import KRProgressHUD

class ViewController: UIViewController {
    
    @IBOutlet weak var mainTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("ViewController - viewDidLoad() is Called")
        
        KRProgressHUD.show()
        
        sayHi(completion: { result in
            print("completion block process: \(result)")
            
            
            KRProgressHUD.showSuccess()
            
            self.mainTitle.text = result
        })
    }

    fileprivate func sayHi(completion : @escaping(String) -> ()){
       
        print("ViewController - sayHi() is called")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
           // Code you want to be delayed
//            print("HI!")
            completion("Hi there")

        }
    }

}

