//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Andres Rambar on 7/28/18.
//  Copyright © 2018 Rambar. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    var restaurant:Restaurant?
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerImage: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        backgroundImageView.image = UIImage(named: (self.restaurant?.image)!)
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        containerImage.image = UIImage(named: (self.restaurant?.image)!)
        backgroundImageView.addSubview(blurEffectView)
//        containerView.transform = CGAffineTransform.init(scaleX: 0.0, y: 0.0)
        containerView.transform = CGAffineTransform(translationX: 0, y: -1000)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        UIView.animate(withDuration: 0.8, animations: {
//            self.containerView.transform = CGAffineTransform.identity
//        })
        
        UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.4, options: .curveEaseInOut, animations: {
                self.containerView.transform = 	CGAffineTransform.identity
        }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func closeButton(_ sender: UIButton) {
        closeButton.transform = CGAffineTransform.identity
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5, animations: {
            self.closeButton.transform = CGAffineTransform(translationX: 1000, y: 10.0)
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
