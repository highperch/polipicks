//
//  MakeAPickViewController.swift
//  PoliPicks
//
//  Created by Justin Peng on 3/13/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class PicksViewController: UIViewController {
    
    var berniePick: Bool!
    var hillaryPick: Bool!
    var donaldPick: Bool!
    var johnPick: Bool!
    var marcoPick: Bool!
    
    var pickIndex: Int!
    var cardViewOriginalCenter: CGPoint!
    
    var images = ["bernie-sanders", "hillary-clinton", "donald-trump", "john-kasich", "marco-rubio"]
    var names = ["Bernie Sanders", "Hillary Clinton", "Donald Trump", "John Kasich", "Marco Rubio"]
    var picks: [Bool]!
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var candidateImage: UIImageView!
    @IBOutlet weak var candidateName: UILabel!
    @IBOutlet var cardViewPanGestureRecognizer: UIPanGestureRecognizer!
    
    func didChooseUp() {
        picks[pickIndex] = true
        print(pickIndex)
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.cardView.center.y = self.cardView.center.y - 400
        })
        nextPick()
    }
    
    func didChooseDown() {
        picks[pickIndex] = false
        print(pickIndex)
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.cardView.center.y = self.cardView.center.y + 400
        })
        nextPick()
    }
    
    func nextPick() {
        //Move to the next candidate
        pickIndex = pickIndex + 1
        //If you're done picking:
        if pickIndex > 4 {
            //Move on to the submit screen
            print(picks)
        } else {
        //Load up the next candidate image and name
        candidateImage.image = UIImage(named: images[pickIndex])
        candidateName.text = names[pickIndex]
        
        //Prep for animation in of the next card
        cardView.center.x = cardViewOriginalCenter.x + 500
        cardView.center.y = cardViewOriginalCenter.y
            
        //Animate the card in
        UIView.animateWithDuration(0.5) { () -> Void in
            self.cardView.center.x = self.cardViewOriginalCenter.x
        }
        }
    }
    
    @IBAction func didPanCard(sender: UIPanGestureRecognizer) {
        var translation = sender.translationInView(view).y
        var velocity = sender.velocityInView(view).y
        
        if sender.state == UIGestureRecognizerState.Began {
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            cardView.center.y = cardViewOriginalCenter.y + translation
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            //If card was moving down past a certain point/speed
            if velocity > 0 || translation > 100 {
                //Consider it a choice for down
                didChooseDown()
            } else if velocity < 0 || translation < -100 {
                //If the card was moving up past a certain point/speed consider it a choice up
                didChooseUp()
            }
        }

    }
    
    @IBAction func didPressUp(sender: UIButton) {
        didChooseUp()
    }
    
    @IBAction func didPressDown(sender: UIButton) {
        didChooseDown()
    }
    
    override func viewWillAppear(animated: Bool) {
        if pickIndex > 5 {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //cardView.layer.shadowOffset = CGSizeMake(5,1)
        cardView.layer.shadowRadius = 1
        cardView.layer.shadowOpacity = 1
        cardViewOriginalCenter = cardView.center
        
        pickIndex = 0
        candidateImage.image = UIImage(named: images[pickIndex])
        candidateName.text = names[pickIndex]
        
        berniePick = true
        hillaryPick = true
        donaldPick = true
        johnPick = true
        marcoPick = true
        
        picks = [berniePick, hillaryPick, donaldPick, johnPick, marcoPick]
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
