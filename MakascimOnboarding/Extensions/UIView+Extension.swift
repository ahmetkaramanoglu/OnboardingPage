//
//  UIView+Extension.swift
//  MakascimOnboarding
//
//  Created by Ahmet Karamanoğlu on 18.02.2024.
//

import UIKit

extension UIView {
   @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
        
    }
}
