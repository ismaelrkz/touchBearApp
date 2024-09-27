//
//  UIView + Extension.swift
//  touchBear
//
//  Created by Ismael Reckziegel on 11/09/24.
//

import Foundation
import UIKit

extension UIView {
    
    func pin(to superView: UIView) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            topAnchor.constraint(equalTo: superView.topAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor)
            
        ])
        
    }
    
}
