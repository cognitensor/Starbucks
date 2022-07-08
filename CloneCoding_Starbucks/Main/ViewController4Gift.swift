//
//  ViewControllerGift.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/06.
//

import UIKit

class ViewController4Gift: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad 4th")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear 4th")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear 4th")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear 4th")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear 4th")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
