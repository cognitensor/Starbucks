//
//  Order.swift
//  Starbucks
//
//  Created by 하늘이 on 2022/07/17.
//

import Foundation
import UIKit


struct Order {
    let orderImage: UIImage
    let orderTitle: String
    let orderEngTitle: String
    var switchOn: Bool
}


var orderCategoryData: [Order] = [
    Order(orderImage: UIImage(named: "order_1new")!, orderTitle: "NEW", orderEngTitle: "", switchOn: false),
    Order(orderImage: UIImage(named: "order_2recommend")!, orderTitle: "추천", orderEngTitle: "Recommend", switchOn: false),
    Order(orderImage: UIImage(named: "order_3reserve")!, orderTitle: "리저브 에스프레소", orderEngTitle: "Reserve Espresso", switchOn: false),
    Order(orderImage: UIImage(named: "order_4drip")!, orderTitle: "리저브 드립", orderEngTitle: "Reserve Drip", switchOn: false),
    Order(orderImage: UIImage(named: "order_5refreshers")!, orderTitle: "리프레서", orderEngTitle: "Starbucks Refreshers", switchOn: false),
    Order(orderImage: UIImage(named: "order_6coldbrew")!, orderTitle: "콜드브루", orderEngTitle: "Cold Brew", switchOn: false),
    Order(orderImage: UIImage(named: "order_7blonde")!, orderTitle: "블론드", orderEngTitle: "Blonde Coffee", switchOn: false),
    Order(orderImage: UIImage(named: "order_8espresso")!, orderTitle: "에스프레소", orderEngTitle: "Espresso", switchOn: false),
    Order(orderImage: UIImage(named: "order_9decaf")!, orderTitle: "디카페인 커피", orderEngTitle: "Decaf Coffee", switchOn: false),
    Order(orderImage: UIImage(named: "order_10frappuccino")!, orderTitle: "프라푸치노", orderEngTitle: "Frappuccino", switchOn: false),
    Order(orderImage: UIImage(named: "order_11blended")!, orderTitle: "블렌디드", orderEngTitle: "Blended", switchOn: false),
    Order(orderImage: UIImage(named: "order_12fizzio")!, orderTitle: "피지오", orderEngTitle: "Starbucks Fizzio", switchOn: false),
    Order(orderImage: UIImage(named: "order_13tevana")!, orderTitle: "티바나", orderEngTitle: "Teavana", switchOn: false),
    Order(orderImage: UIImage(named: "order_14brewed")!, orderTitle: "브루드 커피", orderEngTitle: "Brewed Coffee", switchOn: false),
    Order(orderImage: UIImage(named: "order_15others")!, orderTitle: "기타", orderEngTitle: "Others", switchOn: false),
    Order(orderImage: UIImage(named: "order_16rtd")!, orderTitle: "병음료", orderEngTitle: "RTD", switchOn: false)
]
