//
//  AddBorder.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/16.
//

import Foundation
import QuartzCore
import UIKit

extension CALayer {
    func addBorder(_ arr_edge: [UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in arr_edge {
            let border = CALayer()
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height-width, width: frame.height, height: width)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width-width, y: 0, width: width, height: frame.height)
                break
                
            default:
                break
            }
            border.backgroundColor = color.cgColor
            self.addSublayer(border)
        }
    }
}

//사용예시
//viewOptionShawdow.layer.addBorder([.top], color: UIColor.systemGray4, width: 1.0)

