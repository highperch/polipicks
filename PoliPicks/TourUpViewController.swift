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
        var translation = sender.translationInView(cardView).y
        var velocity = sender.velocityInView(cardView).y
        
        if sender.state == UIGestureRecognizerState.Began {
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            print("velocity:\(velocity)")
            //Only allow to move up
            if translation < 0 {
                //Move the card up by the amount swiped
                cardView.center.y = cardViewOriginalCenter.y + translation
            }
        } else if sender.state == UIGestureRecognizerState.Ended {
            if translation < -100 || velocity < 0 {
                completeStep()
            }
        }
    }
    
    //Declared a function to complete tutorial step
    func completeStep() {
        //Move the card up off the screen
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.cardView.center.y = self.cardView.center.y - 400
            }) { (Bool) -> Void in
                //Show the success label
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    self.successLabel.alpha = 1
                }) { (Bool) -> Void in
                    //After a second, move them on
                    delay(1) { () -> () in
                        self.performSegueWithIdentifier("tourDownSegue", sender: self)
                }
            }
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardViewOriginalCenter = cardView.center
        cardView.layer.cornerRadius = 5
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
