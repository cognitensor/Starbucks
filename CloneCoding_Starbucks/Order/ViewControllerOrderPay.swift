//
//  ViewControllerOrderPay.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/11.
//

import UIKit

class ViewControllerOrderPay: UIViewController {

    @IBOutlet weak var viewCoupon: UIView!
    @IBOutlet weak var viewReceipt: UIView!
    
    @IBOutlet weak var labelMenuTitle: UILabel!
    @IBOutlet weak var labelOnePrice: UILabel!
    @IBOutlet weak var labelMenuSubPrice: UILabel!
    @IBOutlet weak var labelTotalPrice: UILabel!
    
    
    @IBOutlet weak var imageViewMenu: UIImageView!
    
    @IBOutlet weak var btnTotalPay: UIButton!
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: false)
    }
    @IBAction func btnTotalPayAction(_ sender: Any) {
        
        //전에 있던 모든 뷰 지우기
        for v in view.subviews{
           v.removeFromSuperview()
        }
        
        //스토리보드의 이름으로 스토리보드 연결
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //스토리보드와 ViewController파일 연결
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        viewController.orderResult = "주문완료"
        
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: false, completion: nil)
        
        
//        self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
//        let ViewControllerOrderPayResult = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerOrderPayResult") as! ViewControllerOrderPayResult
//
//        guard let pvc = self.presentingViewController else { return }
//
//        self.view.window?.rootViewController?.dismiss(animated: false) {
//            pvc.present(ViewControllerOrderPayResult, animated: true, completion: nil)
//        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        labelMenuTitle.text = UserDefaults.standard.string(forKey: "MenuTitle")
        labelOnePrice.text = "\(UserDefaults.standard.string(forKey: "MenuOnePrice")!)원"
        labelMenuSubPrice.text = "\(UserDefaults.standard.string(forKey: "MenuOnePrice")!)원"
        labelTotalPrice.text = UserDefaults.standard.string(forKey: "MenuTotalPrice")
        imageViewMenu.image = UIImage(named: UserDefaults.standard.string(forKey: "MenuImage")!)
        btnTotalPay.setTitle("\(labelTotalPrice.text!) 결제하기", for: .normal)
        
        viewCoupon.layer.shadowOffset = CGSize(width: 0, height: -1)   //그림자 크기
        viewCoupon.layer.shadowOpacity = 0.05                          //그림자 투명도 0이 투명 1이 불투명
        viewCoupon.layer.shadowRadius = 0  //번지는정도 (0일때 선, 높을 수록 번짐)
        
        viewReceipt.layer.shadowOffset = CGSize(width: 0, height: -1)   //그림자 크기
        viewReceipt.layer.shadowOpacity = 0.05                          //그림자 투명도 0이 투명 1이 불투명
        viewReceipt.layer.shadowRadius = 0  //번지는정도 (0일때 선, 높을 수록 번짐)
        
        
        //원으로 만들기
        imageViewMenu.layer.cornerRadius = imageViewMenu.frame.height/2
        
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
