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
    var newlyCreatedFace: UIImageView!
    
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

    
    @IBAction func smileyPanGesture(_ panGestureRecognizer: UIPanGestureRecognizer) {
        let point = panGestureRecognizer.location(in: self.view)
        
        if panGestureRecognizer.state == .began {
            print("Gesture began at: \(point)")
            // Gesture recognizers know the view they are attached to
            let imageView = panGestureRecognizer.view as! UIImageView
            
            // Create a new image view that has the same image as the one currently panning
            newlyCreatedFace = UIImageView(image: imageView.image)
            
            // Add the new face to the tray's parent view.
            view.addSubview(newlyCreatedFace)
            
            // Initialize the position of the new face.
            newlyCreatedFace.center = imageView.center
            
            // Since the original face is in the tray, but the new face is in the
            // main view, you have to offset the coordinates
            newlyCreatedFace.center.y += trayView.frame.origin.y
            
            // Here we use the method didPan(sender:), which we defined in the previous step, as the action.
            let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(sender:)))
            
            // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
            newlyCreatedFace.isUserInteractionEnabled = true
            newlyCreatedFace.addGestureRecognizer(panGestureRecognizer)
            
        } else if panGestureRecognizer.state == .changed {
            print("Gesture changed at: \(point)")
            newlyCreatedFace.center = point
            
        } else if panGestureRecognizer.state == .ended {
            print("Gesture ended at: \(point)")
        }
    }
    
    func didPan(sender: UIPanGestureRecognizer) {        
        if sender.state == .began {
            print("Gesture began")
            sender.view?.transform = CGAffineTransform(scaleX: 2, y: 2)
        } else if sender.state == .changed {
            print("Gesture is changing")
        } else if sender.state == .ended {
            print("Gesture ended")
            sender.view?.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
}

