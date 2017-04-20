//
//  ViewController.swift
//  Lab4-Animations
//
//  Created by Kevin Thrailkill on 4/19/17.
//  Copyright © 2017 kevinthrailkill. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var trayOriginalCenter: CGPoint!
    var trayCenterWhenOpen: CGPoint!
    var trayCenterWhenClosed: CGPoint!
    
    @IBOutlet weak var trayView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trayCenterWhenOpen =  trayView.center
        trayCenterWhenClosed = CGPoint(x: trayView.center.x, y: 710)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func panAction(_ panGestureRecognizer: UIPanGestureRecognizer) {
        // Absolute (x,y) coordinates in parent view (parentView should be
        // the parent view of the tray)
        let point = panGestureRecognizer.location(in: self.view)
        
        if panGestureRecognizer.state == .began {
            print("Gesture began at: \(point)")
            trayOriginalCenter = trayView.center
        } else if panGestureRecognizer.state == .changed {
            print("Gesture changed at: \(point)")
            let velocity = panGestureRecognizer.velocity(in: trayView)
            
            if velocity.y < 0 {
                
  
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
                    self.trayView.center = self.trayCenterWhenOpen
                }, completion: nil)
            
                
                
                
            } else{
       
                
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
                    self.trayView.center = self.trayCenterWhenClosed
                }, completion: nil)
                
            }
            
        } else if panGestureRecognizer.state == .ended {
            print("Gesture ended at: \(point)")
        }
    }

}

