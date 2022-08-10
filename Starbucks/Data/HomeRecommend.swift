//
//  HomeRecommend.swift
//  Starbucks
//
//  Created by 하늘이 on 2022/07/16.
//

import Foundation
import UIKit

struct HomeRecommend {
    let recommendImage: UIImage
    let recommendTitle: String
}


let homeRecommend: [HomeRecommend] = [
    HomeRecommend(recommendImage: UIImage(named: "menu1_aa")!, recommendTitle: "아이스 카페 아메리카노"),
    HomeRecommend(recommendImage: UIImage(named: "menu2_bunt")!, recommendTitle: "번트 치즈 케이크"),
    HomeRecommend(recommendImage: UIImage(named: "menu3_jamong")!, recommendTitle: "아이스 자몽 허니 블랙티"),
    HomeRecommend(recommendImage: UIImage(named: "menu4_tiramisu")!, recommendTitle: "마스카포네 티라미수 케이크"),
    HomeRecommend(recommendImage: UIImage(named: "menu5_purplesour")!, recommendTitle: "퍼플 사워 블렌디드"),
    HomeRecommend(recommendImage: UIImage(named: "menu6_thechokchok")!, recommendTitle: "The 촉촉 초콜릿 생크림 케이크"),
    HomeRecommend(recommendImage: UIImage(named: "menu7_rich")!, recommendTitle: "리치 가나슈 케이크"),
    HomeRecommend(recommendImage: UIImage(named: "menu8_jeju")!, recommendTitle: "제주 비자림 콜드 브루"),
    HomeRecommend(recommendImage: UIImage(named: "menu9_sparkling")!, recommendTitle: "스파클링 시트러스 에스프레소"),
    HomeRecommend(recommendImage: UIImage(named: "menu10_redvelvet")!, recommendTitle: "레드벨벳 크림치즈 케이크")
]
