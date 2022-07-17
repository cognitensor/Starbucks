//
//  Banner.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/17.
//

import Foundation
import UIKit


struct Banner {
    let bammerImage: UIImage
}

let homeBannerTop: [Banner] = [
    Banner(bammerImage: UIImage(named: "bg_homeTop1")!),
    Banner(bammerImage: UIImage(named: "bg_homeTop2")!),
    Banner(bammerImage: UIImage(named: "bg_homeTop3")!),
    Banner(bammerImage: UIImage(named: "bg_homeTop4")!)
]

let homeBannerGift: [Banner] = [
    Banner(bammerImage: UIImage(named: "bg_homeGift")!)
]


let homeBannerBottom: [Banner] = [
    Banner(bammerImage: UIImage(named: "bg_homeBottom1")!),
    Banner(bammerImage: UIImage(named: "bg_homeBottom2")!),
    Banner(bammerImage: UIImage(named: "bg_homeBottom3")!),
    Banner(bammerImage: UIImage(named: "bg_homeBottom4")!)
]
