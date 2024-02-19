//
//  OnboardingViewController.swift
//  MakascimOnboarding
//
//  Created by Ahmet Karamanoğlu on 18.02.2024.
//

import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var nextButtonTitle: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    var slides: [OnboardingSlide] = []
    var currentPage = 0 {
        
        didSet{
            print("Didsetteki currentpage \(currentPage)")
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButtonTitle.setTitle("Get Started", for: .normal)
            }else {
                nextButtonTitle.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        slides = [
            OnboardingSlide(description: "Essiz makaslar", image: UIImage(named: "slide1")!),
            OnboardingSlide(description: "Essiz taraklar", image: UIImage(named: "slide2")!),
            OnboardingSlide(description: "Ve daha fazlasi...", image: UIImage(named: "slide3")!)
        ]
        
    }
    
    @IBAction func nextButtonClicked(_ sender: UIButton) {
        
        if currentPage == slides.count - 1 {
            let viewController = storyboard?.instantiateViewController(identifier: "HomeNC") as! UINavigationController
            viewController.modalPresentationStyle = .fullScreen
            viewController.modalTransitionStyle = .flipHorizontal
            present(viewController, animated: true)
            
        }
        else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
        
    }
    
  

}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        print("width : \(width)")
        print("scroolview contentoffset : \(scrollView.contentOffset.x)")
        
        currentPage = Int(scrollView.contentOffset.x / width)
        print("scroolviewdeki currentpage: \(currentPage)" )
    }
}
