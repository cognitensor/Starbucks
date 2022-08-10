//
//  ViewControllerOrderLogin.swift
//  Starbucks
//
//  Created by 하늘이 on 2022/07/10.
//

import UIKit

//protocol FullBgDelegate {
//    func presentFullBg(_ controller: ViewControllerOrderLogin, fullIsHidden: Bool)
//}

class ViewControllerOrderLogin: UIViewController {
    
//    var fullbgDelegate: FullBgDelegate?
    
    @IBOutlet weak var labelContent: UILabel!
    
    @IBAction func btnClose(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction func btnAction(_ sender: Any) {
        let ViewControllerOrderLocation = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerOrderLocation") as! ViewControllerOrderLocation

        guard let pvc = self.presentingViewController else { return }

        self.dismiss(animated: false) {
            pvc.present(ViewControllerOrderLocation, animated: true, completion: nil)
        }
    }
    
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        let viewControllerOrderLocation = segue.destination as! ViewControllerOrderLocation
//        self.view.isHidden = true
//        
//        viewControllerOrderLocation.willDismiss = {
//            self.view.isHidden = true
//        }
//
//        viewControllerOrderLocation.didDismiss = {
//            self.dismiss(animated: false)
//        }
//        
//        
//
//    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad 3rd_Login")
        
        self.labelContent.lineBreakStrategy = .hangulWordPriority
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear 3rd_Login")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear 3rd_Login")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear 3rd_Login")
//        fullbgDelegate?.presentFullBg(self, fullIsHidden: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear 3rd_Login")
    }
    

}
