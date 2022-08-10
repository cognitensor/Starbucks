//
//  ViewControllerOrderLocation2.swift
//  Starbucks
//
//  Created by 하늘이 on 2022/07/11.
//

import UIKit

class ViewControllerOrderLocation2: UIViewController {
    
    var willDismiss2: (() -> Void)?
    var didDismiss2: (() -> Void)?
    

    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: false)
    }
    
    @IBAction func btnAction(_ sender: Any) {
        let ViewControllerOrderPay = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerOrderPay") as! ViewControllerOrderPay

        guard let pvc = self.presentingViewController else { return }

        self.dismiss(animated: false) {
            pvc.present(ViewControllerOrderPay, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad 3rd_Location2")

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear 3rd_Location2")
        
    }

    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear 3rd_Location2")
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear 3rd_Location2")
    }

    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear 3rd_Location2")

    }


}
