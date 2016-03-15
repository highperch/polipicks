//
//  TourUpViewController.swift
//  PoliPicks
//
//  Created by Justin Peng on 3/15/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class TourUpViewController: UIViewController {

    //Variables for original center
    var cardViewOriginalCenter: CGPoint!
    var rotation: CGFloat!
    var r2min: CGFloat!
    var r2max: CGFloat!
    
    //Outlets for swipeable card and pan gesture
    @IBOutlet weak var cardView: UIView!
    @IBOutlet var cardPanGestureRecognizer: UIPanGestureRecognizer!
    //Outlet for label (hidden by default)
    @IBOutlet weak var successLabel: UILabel!
    
    @IBAction func didPanCard(sender: UIPanGestureRecognizer) {
        var translation = sender.translationInView(view).y
        var velocity = sender.velocityInView(view).y
        
        if sender.state == UIGestureRecognizerState.Began {
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            
            //Only allow to move up
            if translation > 0 {
                //Move the card up by the amount swiped
                cardView.center.y = cardViewOriginalCenter.y + translation
            }
            if translation > 100 {
                completeStep()
            }
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            //If card was moving up past a certain point
            if velocity > 0 && translation > 50 {
                completeStep()
            }
        }
    }
    
    //Declared a function to complete tutorial step
    func completeStep() {
        //Move the card up off the screen
        UIView.animateWithDuration(0.4) { () -> Void in
            self.cardView.center.y += 400
        }
        //Show the success label
        UIView.animateWithDuration(0.2) { () -> Void in
            self.successLabel.alpha = 1
        }
        //After a second, move them on
        delay(1) { () -> () in
            self.performSegueWithIdentifier("tourDownSegue", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        successLabel.alpha = 0
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
