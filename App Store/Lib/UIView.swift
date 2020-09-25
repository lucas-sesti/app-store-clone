//
//  UIView.swift
//  App Store
//
//  Created by Lucas Sesti on 24/09/20.
//

import UIKit

extension UIView {
    func preencher(top: NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, sizeParam: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false;
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        size(size: sizeParam)
        
    }
    
    func preencherSuperView(padding: UIEdgeInsets = .zero) {
        preencher(
            top: superview?.topAnchor,
            bottom: superview?.bottomAnchor,
            leading: superview?.leadingAnchor,
            trailing: superview?.trailingAnchor,
            padding: padding
        )
    }
    
    func centralizarSuperView(sizeParam: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let superviewCenterX = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterX).isActive = true
        }
        
        if let superviewCenterY = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterY).isActive = true
        }
        
        size(size: sizeParam)
    }
    
    func size(size: CGSize = .zero) {
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}
