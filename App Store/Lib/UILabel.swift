//
//  UILabel.swift
//  App Store
//
//  Created by Lucas Sesti on 24/09/20.
//

import UIKit

extension UILabel {
    
    static func textLabel(text: String, fontSize: CGFloat, numberOfLines: Int = 1, caption: Bool = false, bold: Bool = false) -> UILabel {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.numberOfLines = numberOfLines
        label.text = text
        
        if bold {
            label.font = UIFont.boldSystemFont(ofSize: fontSize)
        }
        
        if caption {
            label.textColor = .gray
        }
        
        return label
    }
    
}
