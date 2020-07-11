//
//  ASDropDownIcon.swift
//  superapp
//
//  Created by Amit on 30/6/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation


class ASDropDownIcon : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit(pos: CGPoint(x: 10, y: 10), color: .black)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit(pos: CGPoint(x: 10, y: 10), color: .black)
    }
    
    init(frame: CGRect, pos: CGPoint, color: UIColor) {
        super.init(frame: frame)
        commonInit(pos: pos, color: color)
    }
    
    public func commonInit(pos: CGPoint, color: UIColor) {
        let size = frame.size
        let path = CGMutablePath()
        
        path.move(to: CGPoint(x: pos.x, y: pos.y))
        path.addLine(to: CGPoint(x: pos.x + size.width/2, y: pos.y + size.height/2))
        path.addLine(to: CGPoint(x:pos.x + size.width, y: pos.y + 0))
        path.addLine(to: CGPoint(x: pos.x, y: pos.y))
        
        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = color.cgColor
        
        layer.insertSublayer(shape, at: 0)
    }
}
