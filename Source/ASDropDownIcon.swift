//
//  ASDropDownIcon.swift
//  superapp
//
//  Created by Amit on 30/6/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

public class ASDropDownIcon : UIView {
    public var isActive = false
    var container: UIView?
    var size: CGSize = CGSize.zero
    var color: UIColor = .black
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    init() {
        super.init(frame: CGRect.zero)
        setup()
    }
    
    init(size: CGSize?, color: UIColor?, isActive: Bool) {
        super.init(frame: CGRect.zero)
        self.isActive = isActive
        self.size = size ?? CGSize(width: 30, height: 30)
        self.color = color ?? UIColor(red: 150.0/255.0, green: 150.0/255.0, blue: 150.0/255.0, alpha: 1.0)
        setup()
    }
    
    public func setup() {
        setupUIElements()
        setupConstraints()
    }
    
    public func setupUIElements() {
        container = UIView()
        addSubview(self.container.unsafelyUnwrapped)
        container?.backgroundColor = .clear
        
        loadDownArrow(size)
    }
    
    public func setupConstraints() {
        if #available(iOS 9.0, *) {
            container?.translatesAutoresizingMaskIntoConstraints = false
            container?.topAnchor.constraint(greaterThanOrEqualTo: topAnchor).isActive = true
            container?.leftAnchor.constraint(greaterThanOrEqualTo: leftAnchor).isActive = true
            container?.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor).isActive = true
            container?.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor).isActive = true
            container?.widthAnchor.constraint(equalToConstant: size.width).isActive = true
            container?.heightAnchor.constraint(equalToConstant: size.height).isActive = true
            container?.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            container?.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        } else {
            // Fallback on earlier versions
        }
    }
    
    public func loadDownArrow(_ size: CGSize) {
        let size = size
        let pos = CGPoint(x: size.width/2.0, y: size.height/2.0)
        let quarter = CGPoint(x: pos.x/2, y: pos.y/2)
        let path = CGMutablePath()
        
        path.move(to: CGPoint(x: pos.x, y: pos.y+quarter.y))
        path.addLine(to: CGPoint(x: pos.x + quarter.x, y: pos.y - quarter.y))
        path.addLine(to: CGPoint(x:pos.x - quarter.x, y: pos.y - quarter.y))
        path.addLine(to: CGPoint(x: pos.x, y: pos.y+quarter.y))
        
        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = color.cgColor
        
        container?.layer.insertSublayer(shape, at: 0)
    }
    
    public func getSize() -> CGSize {
        return size
    }
}
