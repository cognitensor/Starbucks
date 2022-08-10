//
//  TableViewCellCart.swift
//  Starbucks
//
//  Created by 하늘이 on 2022/07/18.
//

import UIKit

protocol NumCountDelegate {
    func numCountChange(index: Int, numcount: Int, oneprice: Int)
    func numCountChangeLabel()
    func reloadTableView()
}

class TableViewCellCart: UITableViewCell {
    
    var numCountDelegate: NumCountDelegate?

    @IBOutlet weak var imageViewCart: UIImageView!
    @IBOutlet weak var labelCartTitle: UILabel!
    @IBOutlet weak var labelCartEngTitle: UILabel!
    @IBOutlet weak var labelCartPrice: UILabel!
    @IBOutlet weak var labelCartCount: UILabel!
    @IBOutlet weak var labelCartTotalPrice: UILabel!

    var cartCellIndex: Int = 0
    var cartCellnumCount: Int = 0
    var cartCellonePrice: Int = 0
        
    var numCount: Int = 0
    var totalPrice: Int = 0
    var onePrice: Int = 0
    
    @IBOutlet weak var btnPlus: UIButton!
    //플러스버튼 누를 때
    @IBAction func btnPlusAction(_ sender: Any) {
        totalPrice = cartCellnumCount*cartCellonePrice
        cartCellnumCount = cartCellnumCount+1
        labelCartCount.text = String(cartCellnumCount)
        totalPrice = totalPrice+cartCellonePrice
        labelCartTotalPrice.text = "\(numberFormatter(number: totalPrice))원"
        btnMinus.tintColor = .darkGray
        btnMinus.isEnabled = true
        
        numCountDelegate?.numCountChange(index: cartCellIndex, numcount: cartCellnumCount, oneprice: cartCellonePrice)
        numCountDelegate?.numCountChangeLabel()
        
    }
    
    @IBOutlet weak var btnMinus: UIButton!
    //마이너스버튼 누를 때
    @IBAction func btnMinusAction(_ sender: Any) {
        if cartCellnumCount > 1{
            totalPrice = cartCellnumCount*cartCellonePrice
            cartCellnumCount = cartCellnumCount-1
            labelCartCount.text = String(cartCellnumCount)
            totalPrice = totalPrice-cartCellonePrice
            labelCartTotalPrice.text = "\(numberFormatter(number: totalPrice))원"
        } else {
            btnMinus.tintColor = .systemGray3
            btnMinus.isEnabled = false
        }
        
        numCountDelegate?.numCountChange(index: cartCellIndex, numcount: cartCellnumCount, oneprice: cartCellonePrice)
        numCountDelegate?.numCountChangeLabel()
    }
    
    @IBAction func btnDeleteAction(_ sender: Any) {
        print("삭제클릭")
        cartData.remove(at: cartCellIndex)
        numCountDelegate?.reloadTableView()
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageViewCart.layer.cornerRadius = imageViewCart.frame.height/2
        

    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override func prepareForReuse() {
//        imageViewCart.image = nil
//        labelCartTitle.text = ""
//        labelCartEngTitle.text = ""
//        labelCartPrice.text = ""
//        labelCartTotalPrice.text = ""
//        labelCartCount.text = ""
    }
}
