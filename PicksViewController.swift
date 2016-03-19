//
//  MakeAPickViewController.swift
//  PoliPicks
//
//  Created by Justin Peng on 3/13/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit
import AFNetworking

class PicksViewController: UIViewController {
    
    //Store user's picks
    var berniePick: Bool!
    var hillaryPick: Bool!
    var donaldPick: Bool!
    var johnPick: Bool!
    var marcoPick: Bool!
    
    //Store the user's pick date
    var pickDate: NSDate!
    
    //pickIndex to iterate over each possible candidate
    var pickIndex: Int!
    //Store original center for animations
    var cardViewOriginalCenter: CGPoint!
    
    //Storing the last updated date to compare to the user's last guesses
    var lastUpdated: Int!
    
    //Arrays for picks and images/names/scores
    var images = ["bernie-sanders", "hillary-clinton", "donald-trump", "john-kasich", "marco-rubio"]
    var names = ["Bernie Sanders", "Hillary Clinton", "Donald Trump", "John Kasich", "Marco Rubio"]
    var picks: [Bool]!
    
    //Stored value for current scores
    var berniePerformance: Int!
    var hillaryPerformance: Int!
    var donaldPerformance: Int!
    var johnPerformance: Int!
    var marcoPerformance: Int!
    
    //NSUserDefaults initialization
    var defaults = NSUserDefaults()
    
    var responseData: [NSDictionary] = []
    
    //Outlets for views (make pick, closed, score)
    @IBOutlet weak var picksClosedView: UIView!
    @IBOutlet weak var makeAPickView: UIView!
    
    //Outlets for Make a Pick elements
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var candidateImage: UIImageView!
    @IBOutlet weak var candidateName: UILabel!
    @IBOutlet var cardViewPanGestureRecognizer: UIPanGestureRecognizer!
    
    func didChooseUp() {
        if pickIndex < 5 {
        picks[pickIndex] = true
        print(pickIndex)
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.cardView.center.y = self.cardView.center.y - 400
        })
        nextPick()
        }
    }
    
    func didChooseDown() {
        if pickIndex < 5 {
        picks[pickIndex] = false
        print(pickIndex)
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.cardView.center.y = self.cardView.center.y + 400
        })
        nextPick()
        }
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
    
    func picksCompleted() {
        pickDate = NSDate()
        defaults.setValue(pickDate, forKey: "pickDate")
        defaults.setValue(berniePick, forKey: "berniePick")
        defaults.setValue(hillaryPick, forKey: "hillaryPick")
        defaults.setValue(donaldPick, forKey: "donaldPick")
        defaults.setValue(johnPick, forKey: "johnPick")
        defaults.setValue(marcoPick, forKey: "marcoPick")
        defaults.synchronize()
        
        makeAPickView.alpha = 0
        picksClosedView.alpha = 1
    }
    
    func calculateScores() {
        
    }
    
    func resetPicks() {
        pickIndex = 0
        
    }
    
    @IBAction func didPanCard(sender: UIPanGestureRecognizer) {
        var translation = sender.translationInView(view).y
        var velocity = sender.velocityInView(view).y
        
        if sender.state == UIGestureRecognizerState.Began {
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            cardView.center.y = cardViewOriginalCenter.y + translation
            print(translation)
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            print("ended")
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
        if pickIndex > 4 {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Stored value for current poll's scores
        var bernieCurrent: Int!
        var hillaryCurrent: Int!
        var donaldCurrent: Int!
        var johnCurrent: Int!
        var marcoCurrent: Int!
        
        //Stored value for last poll's scores
        var berniePast: Int!
        var hillaryPast: Int!
        var donaldPast: Int!
        var johnPast: Int!
        var marcoPast: Int!
        
        //cardView.layer.shadowOffset = CGSizeMake(5,1)
        cardView.layer.shadowRadius = 1
        cardView.layer.shadowOpacity = 1
        cardViewOriginalCenter = cardView.center
        
        //Setting the first candidate (Bernie)'s assets
        pickIndex = 0
        candidateImage.image = UIImage(named: images[pickIndex])
        candidateName.text = names[pickIndex]
        
        //Setting defaults to up (not sure why this is needed for the app not to crash
        berniePick = true
        hillaryPick = true
        donaldPick = true
        johnPick = true
        marcoPick = true
        
        //Populating picks
        picks = [berniePick, hillaryPick, donaldPick, johnPick, marcoPick]
        
        //AFNetworking Setup
        let url = NSURL(string:"http://elections.huffingtonpost.com/pollster/api/charts/2016-national-gop-primary.json")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        
        //AFNetworking Handling
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request,
            completionHandler: { (data, response, error) in
                if let data = data {
                    if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                        data, options:[]) as? NSDictionary {
                            
                            //Pull out Last Updated
                            var lastUpdated = responseDictionary.valueForKey("last_updated")
                            print(lastUpdated!)
                            
                            //Reformat Last Updated
                            let dateFormatter = NSDateFormatter()
                            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                            let date = dateFormatter.dateFromString(String(lastUpdated!))
                            print(date)
                            
                            //Store estimate in blob
                            if let jsonResult = responseDictionary as? [String: AnyObject] {
                                var jsonCleanDictionary = [String: AnyObject]()
                                
                                for (key, value) in jsonResult.enumerate() {
                                    if !(value.1 is NSNull) {
                                        jsonCleanDictionary[value.0] = value.1
                                    }
                                }
                                
                                
                                
                                print("jsonCleanDictionary: \(jsonCleanDictionary)")
                                // Store the returned json blob into the responseData property
                                //self.responseData = jsonCleanDictionary["data"] as! [NSDictionary]
                            }
                    }
                }
        });
        task.resume()
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
