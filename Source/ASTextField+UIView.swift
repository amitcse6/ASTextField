//
//  ASTextField+UIView.swift
//  superapp
//
//  Created by Amit on 20/8/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Swift 4
extension UIView {
    func ast_deactivateImmediateConstraints(){
        NSLayoutConstraint.deactivate(self.ast_immediateConstraints)
    }
    func ast_deactivateAllConstraints() {
        NSLayoutConstraint.deactivate(self.ast_allConstraints)
        translatesAutoresizingMaskIntoConstraints = false
    }
    var ast_immediateConstraints:[NSLayoutConstraint]{
        let constraints = self.superview?.constraints.filter{
            $0.firstItem as? UIView === self || $0.secondItem as? UIView === self
            } ?? []
        return self.constraints + constraints
    }
    var ast_allConstraints:[NSLayoutConstraint] {
        var view: UIView? = self
        var constraints:[NSLayoutConstraint] = []
        while let currentView = view {
            constraints += currentView.constraints.filter {
                return $0.firstItem as? UIView === self || $0.secondItem as? UIView === self
            }
            view = view?.superview
        }
        return constraints
    }
}

// MARK: - Swift 5
//extension UIView {
//    func ast_removeConstraints() { removeConstraints(constraints) }
//    func ast_deactivateAllConstraints() { NSLayoutConstraint.deactivate(ast_getAllConstraints()) }
//    func ast_getAllSubviews() -> [UIView] { return UIView.ast_getAllSubviews(view: self) }
//    func ast_getAllConstraints() -> [NSLayoutConstraint] {
//        var subviewsConstraints = ast_getAllSubviews().flatMap { $0.constraints }
//        if let superview = self.superview {
//            subviewsConstraints += superview.constraints.compactMap { (constraint) -> NSLayoutConstraint? in
//                if let view = constraint.firstItem as? UIView, view == self { return constraint }
//                return nil
//            }
//        }
//        return subviewsConstraints + constraints
//    }
//    class func ast_getAllSubviews(view: UIView) -> [UIView] {
//        return view.subviews.flatMap { [$0] + ast_getAllSubviews(view: $0) }
//    }
//}

