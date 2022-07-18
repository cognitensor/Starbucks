//
//  ViewControllerOrderSize.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/10.
//

import UIKit
import PanModal

class ViewControllerOrderSize: UIViewController {
    
    var resultMainImage: String = ""
    var resultMainTitle: String = ""
    var resultMainEngTitle: String = ""
    var resultMainPrice: Int = 0
    
    //수량선택, 가격변동
    var numCount: Int = 1
    var totalPrice: Int = 0
    var onePrice: Int = 0
    
    @IBOutlet weak var naviTitle: UINavigationItem!
    @IBOutlet weak var labelMainTitle: UILabel!
    @IBOutlet weak var labelMainPrice: UILabel!
    
    @IBOutlet weak var viewOptionShawdow: UIView!
    
    @IBOutlet weak var btn1Tall: UIButton!
    @IBOutlet weak var btn2Grande: UIButton!
    @IBOutlet weak var btn3Venti: UIButton!
    
    @IBOutlet weak var viewCupChoice: UIView!
    @IBOutlet weak var btn1Maejang: UIButton!
    @IBOutlet weak var btn2Mine: UIButton!
    @IBOutlet weak var btn3Once: UIButton!

    @IBOutlet weak var labelNum: UILabel!
    @IBOutlet weak var labelTotalPrice: UILabel!
    
    //담기 버튼 클릭!
    @IBAction func btnCartGoAction(_ sender: Any) {
        
        cartData.append(Cart(cartImage: UIImage(named: resultMainImage)!, cartTitle: resultMainTitle, cartEngTitle: resultMainEngTitle, cartPrice: resultMainPrice, cartCount: numCount, cartToTalPrice: totalPrice))
        
        
        let ViewControllerCartGo = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerCartGo") as! ViewControllerCartGo

        presentPanModal(ViewControllerCartGo)
    }
    
    var arrayBtnSize = [UIButton]()
    var arrayBtnCup = [UIButton]()
    
    //컵 사이즈 버튼 하나만 선택
    @IBAction func selectSizeBtnAction(_ sender: UIButton) {
        for btn in arrayBtnSize {
            btn.layer.cornerRadius = 6

            if btn == sender {
                btn.isSelected = true

                btn.layer.borderWidth = 2
                btn.layer.borderColor = UIColor(named: "sizeSelectColor")?.cgColor
                
                if btn == btn1Tall {
                    btn.setBackgroundImage(UIImage(named: "bg_sizeTall2"), for: .selected)
                } else if btn == btn2Grande {
                    btn.setBackgroundImage(UIImage(named: "bg_sizeGrande2"), for: .selected)
                } else {
                    btn.setBackgroundImage(UIImage(named: "bg_sizeVenti2"), for: .selected)
                }
                    
            } else {
                btn.isSelected = false

                btn.layer.borderWidth = 1
                btn.layer.borderColor = UIColor.systemGray4.cgColor

                if btn == btn1Tall {
                    btn.setBackgroundImage(UIImage(named: "bg_sizeTall"), for: .normal)
                } else if btn == btn2Grande {
                    btn.setBackgroundImage(UIImage(named: "bg_sizeGrande"), for: .normal)
                } else {
                    btn.setBackgroundImage(UIImage(named: "bg_sizeVenti"), for: .normal)
                }
            
            }
        }
    }
    
    //컵 종류 버튼 하나만 선택
    @IBAction func selectOptionBtnAction(_ sender: UIButton) {
        for btn in arrayBtnCup {
            if btn == sender {
                btn.isSelected = true
                btn.backgroundColor = UIColor(named: "sizeSelectColor")
                btn.setTitleColor(.white, for: .selected)
                
            } else {
                btn.isSelected = false
                btn.backgroundColor = UIColor.white
                btn.setTitleColor(.darkGray, for: .normal)
            }
        }
    }
    
  
    
    @IBOutlet weak var btnMinus: UIButton!
    //플러스버튼 누를 때
    @IBAction func btnPlusAction(_ sender: Any) {
        numCount = numCount+1
        labelNum.text = String(numCount)
        totalPrice = totalPrice+onePrice
        labelTotalPrice.text = "\(numberFormatter(number: totalPrice))원"
        btnMinus.tintColor = .darkGray
    }
    //마이너스버튼 누를 때
    @IBAction func btnMinusAction(_ sender: Any) {
        if numCount > 1 {
            numCount = numCount-1
            labelNum.text = String(numCount)
            totalPrice = totalPrice-onePrice
            labelTotalPrice.text = "\(numberFormatter(number: totalPrice))원"
        } else {
            btnMinus.tintColor = .systemGray3
        }
    }
 
//    @IBAction func btnAction(_ sender: Any) {
//        UserDefaults.standard.set(labelMainTitle.text, forKey: "MenuTitle")
//        UserDefaults.standard.set(numberFormatter(number: onePrice), forKey: "MenuOnePrice")
//        UserDefaults.standard.set(labelTotalPrice.text, forKey: "MenuTotalPrice")
//        UserDefaults.standard.set(resultMainImage, forKey: "MenuImage")
//
//        let ViewControllerOrderLogin = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerOrderLogin") as! ViewControllerOrderLogin
//
//        ViewControllerOrderLogin.modalPresentationStyle = .overCurrentContext
//        self.present(ViewControllerOrderLogin, animated: true, completion: nil)
//
//
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let ViewControllerOrderPay = segue.destination as! ViewControllerOrderPay
        if segue.identifier == "goViewControllerOrderPay" {
            
            //MARK: UserDefaults에 데이터 저장
            UserDefaults.standard.set(labelMainTitle.text, forKey: "MenuTitle")
            UserDefaults.standard.set(numberFormatter(number: onePrice), forKey: "MenuOnePrice")
            UserDefaults.standard.set(labelTotalPrice.text, forKey: "MenuTotalPrice")
            UserDefaults.standard.set(resultMainImage, forKey: "MenuImage")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad 3rd_2")
        
        
        
        labelMainTitle.text = resultMainTitle
        labelMainPrice.text = "\(numberFormatter(number: resultMainPrice))원"
        
        totalPrice = resultMainPrice
        onePrice = resultMainPrice
        
        
        //퍼스널옵션 테두리
        viewOptionShawdow.layer.addBorder([.top], color: UIColor.systemGray4, width: 1.0) 
        
        
        //컵 선택 배경
        viewCupChoice.layer.cornerRadius = 20 // 컵 선택 뷰의 꼭짓점 굴곡률
        viewCupChoice.layer.borderWidth = 1 // 컵 선택 뷰의 테두리 굵기
        viewCupChoice.layer.borderColor = UIColor.systemGray4.cgColor // 컵 선택 뷰의 테두리 색상
        
        //버튼 한쪽만 둥글게하기 (반지름은 높이의 반만큼해야 둥글게 됨)
        //.layerMaxXMinYCorner : 우측상단 corner
        //.layerMaxXMaxYCorner : 우측하단 corner
        //.layerMinXMaxYCorner : 좌측하단 corner
        //.layerMinXMinYCorner : 좌측상단 corner
        btn1Maejang.clipsToBounds = true
        btn1Maejang.layer.cornerRadius = 20
        btn1Maejang.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMinXMinYCorner)
        
        btn2Mine.clipsToBounds = true
        btn2Mine.layer.borderWidth = 1 // 개인컵 부분 테두리
        btn2Mine.layer.borderColor = UIColor.systemGray4.cgColor // 개인컵 부분 테두리 색상
                
        btn3Once.clipsToBounds = true
        btn3Once.layer.cornerRadius = 20
        btn3Once.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner, .layerMaxXMaxYCorner)

        
        //컵사이즈 버튼 배열 만들기
        arrayBtnSize.append(btn1Tall)
        arrayBtnSize.append(btn2Grande)
        arrayBtnSize.append(btn3Venti)
        
        //컵사이즈 버튼 테두리 설정
        btn1Tall.isSelected = true
        btn1Tall.layer.cornerRadius = 6
        btn1Tall.layer.borderWidth = 2
        btn1Tall.layer.borderColor = UIColor(named: "sizeSelectColor")?.cgColor
        btn1Tall.setBackgroundImage(UIImage(named: "bg_sizeTall2"), for: .normal)
        
        btn2Grande.layer.cornerRadius = 6
        btn2Grande.layer.borderWidth = 1
        btn2Grande.layer.borderColor = UIColor.systemGray4.cgColor

        btn3Venti.layer.cornerRadius = 6
        btn3Venti.layer.borderWidth = 1
        btn3Venti.layer.borderColor = UIColor.systemGray4.cgColor


        
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
    
}


extension ViewControllerOrderSize: PanModalPresentable {

    var panScrollable: UIScrollView? {
        return nil
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(300)
    }
}
