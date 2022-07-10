//
//  ViewControllerOrder2Size.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/10.
//

import UIKit

class ViewControllerOrder2Size: UIViewController {
    
    var resultMainTitle: String = ""

    @IBOutlet weak var labelMainTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad 3rd_2")
        
        labelMainTitle.text = resultMainTitle
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear 3rd_2")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear 3rd_2")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear 3rd_2")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear 3rd_2")
    }
    


}
