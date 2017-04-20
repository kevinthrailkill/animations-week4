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
    
    @IBOutlet weak var trayView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            let translation = panGestureRecognizer.translation(in: trayView)
            print("Gesture changed at: \(point)")
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
        } else if panGestureRecognizer.state == .ended {
            print("Gesture ended at: \(point)")
        }
    }

}

