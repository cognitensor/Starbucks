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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        imageViewMenu.layer.cornerRadius = imageViewMenu.frame.height/2
        
        labelMenuTitle.text = UserDefaults.standard.string(forKey: "MenuTitle")
        imageViewMenu.image = UIImage(named: UserDefaults.standard.string(forKey: "MenuImage")!)
        // Do any additional setup after loading the view.
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
