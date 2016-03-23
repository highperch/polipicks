//
//  TourDownViewController.swift
//  PoliPicks
//
//  Created by Justin Peng on 3/15/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class TourDownViewController: UIViewController {

    //Variables for original center
    var cardViewOriginalCenter: CGPoint!
    var rotation: CGFloat!
    var r2min: CGFloat!
    var r2max: CGFloat!
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var successLabel: UILabel!
    @IBOutlet var panGestureRecognizer: UIPanGestureRecognizer!
    
    @IBAction func didPanCard(sender: UIPanGestureRecognizer) {
        var translation = sender.translationInView(view).y
        var velocity = sender.velocityInView(view).y
        
        if sender.state == UIGestureRecognizerState.Began {
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            
            //Only allow to move down
            if translation > 0 {
                //Move the card down by the amount swiped
                cardView.center.y = cardViewOriginalCenter.y + translation
            }
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            //If card was moving down past a certain point
            if velocity > 0 || translation > 100 {
                completeStep()
            }
        }
    }
    
    //Declared a function to complete tutorial step
    func completeStep() {
        //Move the card off the screen
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.cardView.center.y = self.cardView.center.y + 400
            }) { (Bool) -> Void in
                //Show the success label
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    self.successLabel.alpha = 1
                    }) { (Bool) -> Void in
                        //After a second, move them on
                        delay(0.75) { () -> () in
                            self.performSegueWithIdentifier("tourFinalSegue", sender: self)
                        }
                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardViewOriginalCenter = cardView.center
        successLabel.alpha = 0
        cardView.layer.cornerRadius = 5
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
