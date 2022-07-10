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
    @IBOutlet weak var viewOptionShawdow: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad 3rd_2")
        
        labelMainTitle.text = resultMainTitle
        
        
        viewOptionShawdow.layer.shadowOffset = CGSize(width: 0, height: -1)   //그림자 크기
        viewOptionShawdow.layer.shadowOpacity = 0.1                          //그림자 투명도 0이 투명 1이 불투명
        viewOptionShawdow.layer.shadowRadius = 0  //번지는정도 (0일때 선, 높을 수록 번짐)
        
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
