//
//  TableViewCellOrder.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/07.
//

import Foundation
import UIKit


class TableViewCellOrder: UITableViewCell {
    
    
    @IBOutlet weak var orderContentView: UIView!
    @IBOutlet weak var orderTitleImage: UIImageView!
    @IBOutlet weak var orderTitleLabel: UILabel!
    @IBOutlet weak var orderSubTitleLabel: UILabel!
    @IBOutlet weak var orderSwitch: UISwitch!
    @IBAction func orderSwitchAction(_ sender: Any) {
        if orderSwitch.isOn {
            print("on")
        } else{
            print("off")
        }
    }
    
    //셀이 렌더링(그릴때) 될때
    override func awakeFromNib() {
        super.awakeFromNib()
//        print("TableViewCellOrder -awakeFromNib")
        
        //이미지 원으로 만들기
        orderTitleImage.layer.cornerRadius = orderTitleImage.frame.height/2
        
    }
    
    
    //셀 제사용하지 않고 초기화시켜주는 메서드
    override func prepareForReuse() {
        super.prepareForReuse()

        orderTitleImage.image = nil
        orderTitleLabel.text = nil
        orderSubTitleLabel.text = nil
        orderSwitch.isOn = false
        
    }
    
}
