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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.labelContent.lineBreakStrategy = .hangulWordPriority

        
        imageViewMenu.layer.cornerRadius = imageViewMenu.frame.height/2
        
        labelMenuTitle.text = UserDefaults.standard.string(forKey: "MenuTitle")
        imageViewMenu.image = UIImage(named: UserDefaults.standard.string(forKey: "MenuImage")!)
        // Do any additional setup after loading the view.
    }
    


}
