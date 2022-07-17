//
//  ViewControllerOrderPayResult.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/11.
//

import UIKit

class ViewControllerOrderPayResult: UIViewController {

    @IBOutlet weak var imageViewMenu: UIImageView!
    @IBOutlet weak var labelMenuTitle: UILabel!
    @IBOutlet weak var labelContent: UILabel!
    @IBOutlet weak var progressViewResult: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad OrderPayResult")

        self.labelContent.lineBreakStrategy = .hangulWordPriority

        imageViewMenu.layer.cornerRadius = imageViewMenu.frame.height/2
        
        labelMenuTitle.text = UserDefaults.standard.string(forKey: "MenuTitle")
        imageViewMenu.image = UIImage(named: UserDefaults.standard.string(forKey: "MenuImage")!)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear OrderPayResult")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear OrderPayResult")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear OrderPayResult")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear OrderPayResult")
    }

}
