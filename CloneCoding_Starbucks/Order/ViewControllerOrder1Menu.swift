//
//  ViewController3Order1ClickCategory.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/08.
//

import UIKit

class ViewControllerOrder1Menu: UIViewController {

    @IBAction func didTabAction(_ sender: Any) {
        
        dismiss(animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad 3rd_1")
    
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear 3rd_1")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear 3rd_1")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear 3rd_1")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear 3rd_1")
    }
    

}
