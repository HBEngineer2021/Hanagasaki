//
//  SplashViewController.swift
//  Hanagasaki
//
//  Created by Motoki Onayama on 2021/08/01.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {

    // 1. Create the AnimationView
    private var animationView: AnimationView?
    private var swipeLockAnimation: AnimationView?
    
    @IBOutlet weak var splashImage: UIImageView! {
        didSet {
            splashImage.frame = CGRect(x: 60, y: 184, width: 200, height: 200)
        }
    }
    
    @IBOutlet weak var swipeView: UIView! {
        didSet {
            swipeView.frame = CGRect(x: 40, y: 444, width: 240, height: 55)
        }
    }
    
    override func viewDidLoad() {

      super.viewDidLoad()
        
      // 2. Start AnimationView with animation name (without extension)
      animationView = .init(name: "55478-hello-bubble")
      
        swipeLockAnimation = .init(name: "697-unlock")
        
      //animationView!.frame = view.bounds
        
        animationView!.frame = CGRect(x: 0, y: 100, width: 150, height: 150)
        swipeLockAnimation!.frame = CGRect(x: 40, y: 444, width: 240, height: 70)
      // 3. Set animation content mode
      
      //animationView!.contentMode = .scaleAspectFit
      
      // 4. Set animation loop mode
      
        animationView!.loopMode = .loop
        
        swipeLockAnimation!.loopMode = .loop
      // 5. Adjust animation speed
      
      animationView!.animationSpeed = 0.5
        swipeLockAnimation?.animationSpeed = 0.5
        //animationView!.frame = CGRect(x: 0, y: 437, width: 240, height: 65)
        
      view.addSubview(animationView!)
        view.bringSubviewToFront(animationView!)
        view.addSubview(swipeLockAnimation!)
          view.sendSubviewToBack(swipeLockAnimation!)
      // 6. Play animation
      
      animationView!.play()
    swipeLockAnimation!.play()
    }
    
    @IBAction func rightSwipe(_ sender: Any) {
        let storyboard = UIStoryboard(name: "TabBarController", bundle: nil)
         let TabBarController = storyboard.instantiateViewController(withIdentifier: "TabBarController")
         //present(SplashViewController, animated: true, completion: nil)
        TabBarController.modalPresentationStyle = .fullScreen
        present(TabBarController, animated: true)
         //ArticleEntryViewController.articleDataDelegate = self
         self.navigationController?.pushViewController(TabBarController, animated: true)
    }
    
}
