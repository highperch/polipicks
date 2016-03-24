//
//  ScoreViewController.swift
//  PoliPicks
//
//  Created by Justin Peng on 3/22/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    @IBOutlet weak var scoreCommentary: UILabel!
    @IBOutlet weak var scoreSummary: UILabel!
    
    @IBOutlet weak var cruzScoreImage: UIImageView!
    @IBOutlet weak var kasichScoreImage: UIImageView!
    @IBOutlet weak var trumpScoreImage: UIImageView!
    
    @IBOutlet weak var bernieScoreImage: UIImageView!
    @IBOutlet weak var hillaryScoreImage: UIImageView!
    
    @IBOutlet weak var playAgain: UIButton!
    
    @IBAction func didTapPlayAgain(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    var sessionScore: Int!
    var totalScore: Int!
    
    var cruzGuess: Bool!
    var kasichGuess: Bool!
    var trumpGuess: Bool!
    var bernieGuess: Bool!
    var hillaryGuess: Bool!
    
    var cruzPerformance: Double!
    var kasichPerformance: Double!
    var trumpPerformance: Double!
    var berniePerformance: Double!
    var hillaryPerformance: Double!
    
    func showScore(candidateGuess: Bool, candidatePerformance: Double, candidateScoreImage: UIImageView) {
        var candidateCompare: Bool!
        if candidatePerformance > 0 {
            candidateCompare = true
        } else if candidatePerformance <= 0 {
            candidateCompare = false
        }
        if candidateGuess == candidateCompare {
            sessionScore = sessionScore + 1
            candidateScoreImage.image = UIImage(named: "correct")
        } else {
            candidateScoreImage.image = UIImage(named: "wrong")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Load total score, default session score to zero
        sessionScore = 0
        totalScore = defaults.integerForKey("totalScore")
        
        /*
        //Load player guesses
        print("after segue")
        cruzGuess = defaults.boolForKey("cruzPick")
        print("cruzPick:\(cruzGuess)")
        print("cruzPerformance:\(cruzPerformance)")
        kasichGuess = defaults.boolForKey("kasichPick")
        print("kasichPick:\(kasichGuess)")
        print("kasichPerformance:\(kasichPerformance)")
        trumpGuess = defaults.boolForKey("trumpPick")
        print("trumpPick:\(trumpGuess)")
        print("trumpPerformance:\(trumpPerformance)")
        bernieGuess = defaults.boolForKey("berniePick")
        print("berniePick:\(bernieGuess)")
        print("berniePerformance:\(berniePerformance)")
        hillaryGuess = defaults.boolForKey("hillaryPick")
        print("hillaryPick:\(hillaryGuess)")
        print("hillaryPerformance:\(hillaryPerformance)")
        */
        
        //Configure the play again button
        playAgain.backgroundColor = UIColor.clearColor()
        playAgain.layer.cornerRadius = 5
        playAgain.layer.borderWidth = 1.5
        playAgain.layer.borderColor = UIColor(red: 30, green: 181, blue: 237, alpha: 1).CGColor
        
        //Hide the labels and play again button
        scoreCommentary.alpha = 0
        scoreSummary.alpha = 0
        playAgain.alpha = 0
        
        //Hide the score feedback images
        cruzScoreImage.alpha = 0
        kasichScoreImage.alpha = 0
        trumpScoreImage.alpha = 0
        bernieScoreImage.alpha = 0
        hillaryScoreImage.alpha = 0
        
        //Set the images to be shown
        showScore(cruzGuess, candidatePerformance: cruzPerformance, candidateScoreImage: cruzScoreImage)
        showScore(kasichGuess, candidatePerformance: kasichPerformance, candidateScoreImage: kasichScoreImage)
        showScore(trumpGuess, candidatePerformance: trumpPerformance, candidateScoreImage: trumpScoreImage)
        showScore(bernieGuess, candidatePerformance: berniePerformance, candidateScoreImage: bernieScoreImage)
        showScore(hillaryGuess, candidatePerformance: hillaryPerformance, candidateScoreImage: hillaryScoreImage)
        print("sessionScore:\(sessionScore)")
        
        totalScore = totalScore + sessionScore
        defaults.setInteger(totalScore, forKey: "totalScore")
        defaults.synchronize()
        
        //Set the score summary and score button
        //Trying to format bolded, seems to be buggy
        let sessionScoreBolded = NSMutableAttributedString(string: String(sessionScore), attributes: [NSFontAttributeName : UIFont.boldSystemFontOfSize(scoreSummary.font.pointSize)])
        let totalScoreBolded = NSMutableAttributedString(string: String(totalScore))
        totalScoreBolded.addAttribute(NSFontAttributeName, value: UIFont.boldSystemFontOfSize(scoreSummary.font.pointSize), range: (String(totalScore) as NSString).rangeOfString(String(totalScore)))
        
        if sessionScore == 0 {
            scoreCommentary.text = "Better luck next time."
            if totalScore == 0 {
                scoreSummary.text = "You didn't earn points today, try again!"
            } else {
                scoreSummary.text = "You didn't earn points today, you have \(totalScore) so far."
            }
            
        } else if sessionScore > 0 {
            scoreCommentary.text = "Nice work!"
            scoreSummary.text = "You earned \(String(sessionScore)) points today, you're up to \(String(totalScore)) all time."
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        //Show the scores one by one
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.cruzScoreImage.alpha = 1
            }) { (Bool) -> Void in
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    self.kasichScoreImage.alpha = 1
                    }, completion: { (Bool) -> Void in
                        UIView.animateWithDuration(0.2, animations: { () -> Void in
                            self.trumpScoreImage.alpha = 1
                            }, completion: { (Bool) -> Void in
                                UIView.animateWithDuration(0.2, animations: { () -> Void in
                                    self.bernieScoreImage.alpha = 1
                                    }, completion: { (Bool) -> Void in
                                        UIView.animateWithDuration(0.2, animations: { () -> Void in
                                            self.hillaryScoreImage.alpha = 1
                                        })
                                })
                        })
                })
        }
        //After a short delay, show their total and summary
        delay(1.5) { () -> () in
            self.scoreCommentary.alpha = 1
            self.scoreSummary.alpha = 1
            self.playAgain.alpha = 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destinationViewController = segue.destinationViewController as! PicksViewController
        destinationViewController.resetPicks()
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
