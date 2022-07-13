//
//  ViewControllerOrder2Size.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/10.
//

import UIKit

class ViewControllerOrder2Size: UIViewController {
    
    var resultMainTitle: String = ""
    var resultMainImage: String = ""
    
    @IBOutlet weak var labelMainTitle: UILabel!
    @IBOutlet weak var viewOptionShawdow: UIView!
    
//    @IBOutlet var viewFullBg: UIView!
    
    
    @IBOutlet weak var btn1Tall: UIButton!
    @IBOutlet weak var btn2Grande: UIButton!
    @IBOutlet weak var btn3Venti: UIButton!
    
    @IBOutlet weak var viewCupChoice: UIView!
    @IBOutlet weak var btn1Maejang: UIButton!
    @IBOutlet weak var btn2Mine: UIButton!
    @IBOutlet weak var btn3Once: UIButton!

    @IBOutlet weak var labelNum: UILabel!
    @IBOutlet weak var labelTotalPrice: UILabel!
    
    
    var arrayBtnSize = [UIButton]()
    var arrayBtnCup = [UIButton]()
    
    //컵 사이즈 버튼 하나만 선택
    @IBAction func selectSizeBtnAction(_ sender: UIButton) {
        for btn in arrayBtnCup {
            if btn == sender {
                btn.isSelected = true
                print("gpgpgp")
                
            } else {
                btn.isSelected = false
                
            
            }
        }
    }
    
    //컵 사이즈 버튼 하나만 선택
    @IBAction func selectOptionBtnAction(_ sender: UIButton) {
        for btn in arrayBtnCup {
            if btn == sender {
                btn.isSelected = true
                btn.backgroundColor = UIColor(rgb: 0x4AA56B)
                //!!!!!이거 색상변경안됨
                btn.setTitleColor(.white, for: .normal)

                
            } else {
                btn.isSelected = false
                btn.backgroundColor = UIColor.white
                btn.setTitleColor(UIColor(rgb: 0x000000), for: .normal)
            }
        }
    }
    
    
    //수량선택, 가격변동
    var numCount: Int = 1
    var totalPrice: Int = 5000
    var onePrice: Int = 5000
    
    @IBAction func btnPlusAction(_ sender: Any) {
        numCount = numCount+1
        labelNum.text = String(numCount)
        totalPrice = totalPrice+onePrice
        labelTotalPrice.text = "\(numberFormatter(number: totalPrice))원"
    }

    @IBAction func btnMinusAction(_ sender: Any) {
        if numCount > 0 {
            numCount = numCount-1
            labelNum.text = String(numCount)
            totalPrice = totalPrice-onePrice
            labelTotalPrice.text = "\(numberFormatter(number: totalPrice))원"
            
        }
    }
    
    
    @IBAction func btnAction(_ sender: Any) {
        UserDefaults.standard.set(labelMainTitle.text, forKey: "MenuTitle")
        UserDefaults.standard.set(numberFormatter(number: onePrice), forKey: "MenuOnePrice")
        UserDefaults.standard.set(labelTotalPrice.text, forKey: "MenuTotalPrice")
        UserDefaults.standard.set(resultMainImage, forKey: "MenuImage")
        
        let ViewControllerOrderLogin = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerOrderLogin") as! ViewControllerOrderLogin
        
        ViewControllerOrderLogin.modalPresentationStyle = .overCurrentContext
        self.present(ViewControllerOrderLogin, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad 3rd_2")
        
        labelMainTitle.text = resultMainTitle
        
        
        viewOptionShawdow.layer.shadowOffset = CGSize(width: 0, height: -1)   //그림자 크기
        viewOptionShawdow.layer.shadowOpacity = 0.1                          //그림자 투명도 0이 투명 1이 불투명
        viewOptionShawdow.layer.shadowRadius = 0  //번지는정도 (0일때 선, 높을 수록 번짐)
        
        
        viewCupChoice.layer.cornerRadius = 20 // 컵 선택 뷰의 꼭짓점 굴곡률
        viewCupChoice.layer.borderWidth = 1 // 컵 선택 뷰의 테두리 굵기
        viewCupChoice.layer.borderColor = UIColor.systemGray.cgColor // 컵 선택 뷰의 테두리 색상
        
        btn2Mine.layer.borderWidth = 1 // 개인컵 부분 테두리
        btn2Mine.layer.borderColor = UIColor.systemGray.cgColor // 개인컵 부분 테두리 색상
        
        //버튼 한쪽만 둥글게하기 (반지름은 높이의 반만큼해야 둥글게 됨)
        //.layerMaxXMinYCorner : 우측상단 corner
        //.layerMaxXMaxYCorner : 우측하단 corner
        //.layerMinXMaxYCorner : 좌측하단 corner
        //.layerMinXMinYCorner : 좌측상단 corner
        btn1Maejang.clipsToBounds = true
        btn1Maejang.layer.cornerRadius = 20
        btn1Maejang.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMinXMinYCorner)
        
        btn2Mine.clipsToBounds = true
                
        btn3Once.clipsToBounds = true
        btn3Once.layer.cornerRadius = 20
        btn3Once.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner, .layerMaxXMaxYCorner)

        
        //컵사이즈 버튼 배열 만들기
        arrayBtnSize.append(btn1Tall)
        arrayBtnSize.append(btn2Grande)
        arrayBtnSize.append(btn3Venti)
        
        
        //컵선택 버튼 배열 만들기
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
    
    func numberFormatter(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: NSNumber(value: number))!
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
