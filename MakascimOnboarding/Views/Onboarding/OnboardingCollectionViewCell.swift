//
//  OnboardingCollectionViewCell.swift
//  MakascimOnboarding
//
//  Created by Ahmet Karamanoğlu on 18.02.2024.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImage: UIImageView!
    
    @IBOutlet weak var slideDescription: UILabel!
    
    func setup(_ slide: OnboardingSlide) {
        slideImage.image = slide.image
        slideDescription.text = slide.description
    }
    
}
