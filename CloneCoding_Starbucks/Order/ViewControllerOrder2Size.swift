//
//  ViewControllerOrder2Size.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/10.
//

import UIKit

class ViewControllerOrder2Size: UIViewController, FullBgDelegate {
    
    var resultMainTitle: String = ""
    
    @IBOutlet weak var labelMainTitle: UILabel!
    @IBOutlet weak var viewOptionShawdow: UIView!
    
    @IBOutlet var viewFullBg: UIView!
    
    @IBOutlet weak var btn1Maejang: UIButton!
    @IBOutlet weak var btn2Mine: UIButton!
    @IBOutlet weak var btn3Once: UIButton!

    @IBOutlet weak var labelNum: UILabel!
    @IBOutlet weak var labelTotalPrice: UILabel!
    
    @IBAction func selectOptionBtnAction(_ sender: UIButton) {
        for btn in arrayBtnCup {
            if btn == sender {
                btn.isSelected = true
                btn.backgroundColor = UIColor(rgb: 0x4AA56B)
                btn.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
                
            } else {
                btn.isSelected = false
                btn.backgroundColor = UIColor.white
                btn.setTitleColor(UIColor(rgb: 0x000000), for: .normal)
            }
        }
    }
    
    
    var numCount: Int = 1
    var totalPrice: Int = 5000
    var onePrice: Int = 5000
    
    @IBAction func btnPlusAction(_ sender: Any) {
        numCount = numCount+1
        labelNum.text = String(numCount)
        totalPrice = totalPrice+onePrice
        labelTotalPrice.text = "\(String(totalPrice))원"
    }

    @IBAction func btnMinusAction(_ sender: Any) {
        if numCount > 0 {
            numCount = numCount-1
            labelNum.text = String(numCount)
            totalPrice = totalPrice-onePrice
            labelTotalPrice.text = "\(String(totalPrice))원"
            
        }
        
    
    }
    
    
    
    
    var arrayBtnCup = [UIButton]()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ViewControllerOrderLogin = segue.destination as! ViewControllerOrderLogin
        
        ViewControllerOrderLogin.fullbgDelegate = self
        viewFullBg.isHidden = false
    }
    
    
    func presentFullBg(_ controller: ViewControllerOrderLogin, fullIsHidden: Bool) {
        viewFullBg.isHidden = fullIsHidden
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad 3rd_2")
        
        labelMainTitle.text = resultMainTitle
        
        viewOptionShawdow.layer.shadowOffset = CGSize(width: 0, height: -1)   //그림자 크기
        viewOptionShawdow.layer.shadowOpacity = 0.1                          //그림자 투명도 0이 투명 1이 불투명
        viewOptionShawdow.layer.shadowRadius = 0  //번지는정도 (0일때 선, 높을 수록 번짐)
        
        
        //버튼 한쪽만 둥글게하기 (반지름은 높이의 반만큼해야 둥글게 됨)
//            .layerMaxXMinYCorner : 우측상단 corner
//            .layerMaxXMaxYCorner : 우측하단 corner
//            .layerMinXMaxYCorner : 좌측하단 corner
//            .layerMinXMinYCorner : 좌측상단 corner
        btn1Maejang.clipsToBounds = true
        btn1Maejang.layer.cornerRadius = 20
        btn1Maejang.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMinXMinYCorner)
        
        btn2Mine.clipsToBounds = true
        
        btn3Once.clipsToBounds = true
        btn3Once.layer.cornerRadius = 20
        btn3Once.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner, .layerMaxXMaxYCorner)
        
        //버튼배열만들기
        arrayBtnCup.append(btn1Maejang)
        arrayBtnCup.append(btn2Mine)
        arrayBtnCup.append(btn3Once)
        
        
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


//사용예시
//
//let color = UIColor(rgb: 0xFFFFFF)
//
//
//
//사용예시 : 알파값 포함을 하고자 한다면?
//
//let color = UIColor(rgb: 0xFFFFFF).withAlphaComponent(1.0)
//
//let color2 = UIColor(argb: 0xFFFFFFFF)

//hex코드 사용하기
extension UIColor {

    convenience init(red: Int, green: Int, blue: Int, a: Int = 0xFF) {

        self.init(

            red: CGFloat(red) / 255.0,

            green: CGFloat(green) / 255.0,

            blue: CGFloat(blue) / 255.0,

            alpha: CGFloat(a) / 255.0

        )

    }

 

    convenience init(rgb: Int) {

           self.init(

               red: (rgb >> 16) & 0xFF,

               green: (rgb >> 8) & 0xFF,

               blue: rgb & 0xFF

           )

       }

    

    // let's suppose alpha is the first component (ARGB)

    convenience init(argb: Int) {

        self.init(

            red: (argb >> 16) & 0xFF,

            green: (argb >> 8) & 0xFF,

            blue: argb & 0xFF,

            a: (argb >> 24) & 0xFF

        )

    }

}
