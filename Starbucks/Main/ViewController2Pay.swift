//
//  ViewControllerPay.swift
//  Starbucks
//
//  Created by 하늘이 on 2022/07/06.
//

import UIKit

class ViewController2Pay: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad 2nd")
        // Do any additional setup after loading the view.
        
        //탭바 윗줄 없애기
        self.tabBarController?.tabBar.clipsToBounds = true
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear 2nd")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear 2nd")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear 2nd")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear 2nd")
    }
    


}
