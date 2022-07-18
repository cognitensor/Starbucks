//
//  Cart.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/18.
//

import Foundation
import UIKit

struct Cart {
    let cartImage: UIImage
    let cartTitle: String
    let cartEngTitle: String
    var cartPrice: Int
    var cartCount: Int
    var cartToTalPrice: Int
}

var cartData: [Cart] = []


//let cartData: [Cart] = [
//    Cart(cartImage: UIImage(named: "menu1")!, cartTitle: "아이스 아메리카노", cartEngTitle: "ice americano", cartPrice: 5500, cartCount: 3, cartToTalPrice: 16500)
//
//]

