//
//  ViewControllerOrderLocation.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/11.
//

import UIKit


class ViewControllerOrderLocation: UIViewController {
    
    @IBOutlet weak var viewMain: UIView!
    
    var willDismiss: (() -> Void)?
    var didDismiss: (() -> Void)?
    
    @IBAction func btnCancle(_ sender: Any) {
        willDismiss?()
        
        dismiss(animated: false) {
            self.didDismiss?()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        

        let viewControllerOrderLocation2 = segue.destination as! ViewControllerOrderLocation2

        viewControllerOrderLocation2.willDismiss2 = {
            self.view.isHidden = true
        }

        viewControllerOrderLocation2.didDismiss2 = {
            self.dismiss(animated: false)
            self.didDismiss?()
            
        }
        


    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad 3rd_Location")

//        viewMain.layer.borderWidth = 1
//        viewMain.layer.borderColor = CGColor(red: 255.0, green: 255.0, blue: 0, alpha: 1)
        
            
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear 3rd_Location")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear 3rd_Location")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear 3rd_Location")
//        willDismiss?()
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear 3rd_Location")
//        self.didDismiss?()
    }
    

    
}
