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
    var cruzPick: Bool!
    var trumpPick: Bool!
    var kasichPick: Bool!
    
    //Store the user's pick date
    var pickDate: NSDate!
    
    //pickIndex to iterate over each possible candidate
    var pickIndex: Int!
    //Store original center for animations
    var cardViewOriginalCenter: CGPoint!
    
    //If there are new results
    var areNewResults: Bool!
    
    //Arrays for picks and images/names/scores
    var images = ["bernie-sanders", "hillary-clinton", "ted-cruz", "donald-trump", "john-kasich"]
    var names = ["Bernie Sanders", "Hillary Clinton", "Ted Cruz", "Donald Trump", "John Kasich"]
    var performance: [Double]!
    var picks: [Bool]!
    
    //Stored value for last movement of each candidate
    var berniePerformance: Double!
    var hillaryPerformance: Double!
    var cruzPerformance: Double!
    var trumpPerformance: Double!
    var kasichPerformance: Double!

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
    @IBOutlet weak var candidatePerformance: UILabel!
    @IBOutlet weak var candidatePerformanceArrow: UIImageView!
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
        //Load up the next candidate image, name, and performance
        candidateImage.image = UIImage(named: images[pickIndex])
        candidateName.text = names[pickIndex]
        candidatePerformance.text = String(performance[pickIndex])
        print(performance[pickIndex])
        //Set pick arrow direction
        if performance[pickIndex] > 0 {
            candidatePerformanceArrow.image = UIImage(named: "ic_arrow_drop_up")
        } else if performance[pickIndex] < 0 {
            candidatePerformanceArrow.image = UIImage(named: "ic_arrow_drop_down")
        }
        
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
        defaults.setValue(cruzPick, forKey: "cruzPick")
        defaults.setValue(trumpPick, forKey: "donaldPick")
        defaults.setValue(kasichPick, forKey: "johnPick")
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
        //Did not make picks
        //Show option to make picks
        
        //Made picks, no updated picks available
        //Show pick summary
        if pickIndex > 4 {
            
        }
        
        //Made picks, updated picks available
        //Show score screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Fake pickDate
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        pickDate = dateFormatter.dateFromString("2015-03-16")
        print("pickDate: \(pickDate)")
        
        //pickDate = NSDate()
        
        areNewResults = false
        
        //Stored value for current poll's scores
        var bernieCurrent: Int!
        var hillaryCurrent: Int!
        var cruzCurrent: Double!
        var trumpCurrent: Double!
        var kasichCurrent: Double!
        
        //Stored value for last poll's scores
        var berniePast: Int!
        var hillaryPast: Int!
        var cruzPast: Double!
        var trumpPast: Double!
        var kasichPast: Double!
        
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
        cruzPick = true
        trumpPick = true
        kasichPick = true
        
        //Populating picks
        picks = [berniePick, hillaryPick, cruzPick, trumpPick, kasichPick]
        
        //Setting defaults to 0 in case we can't pull any values
        berniePerformance = 0
        hillaryPerformance = 0
        cruzPerformance = 0
        trumpPerformance = 0
        kasichPerformance = 0
        
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
                            if (date!.isGreaterThanDate(self.pickDate)) {
                                self.areNewResults = true
                            }
                            print(self.areNewResults)
                            
                            //Store estimate in blob
                            if let jsonResult = responseDictionary as? [String: AnyObject] {
                                
                            //Clean out the nulls from it
                            let clean:[String: AnyObject] = Dictionary(
                                jsonResult.flatMap(){
                                    // convert NSNull to unset optional
                                    // flatmap filters unset optionals
                                    return ($0.1 is NSNull) ? .None : $0
                                })
                                //Store estimates by date in responseData
                                self.responseData = clean["estimates_by_date"] as! [NSDictionary]
                            }
                            //Pull out the latest set of data
                            var latestDataRaw = self.responseData[0]
                            //Parse out the scores
                            var latestData = latestDataRaw.valueForKeyPath("estimates.value")
                            
                            //Pull out the second most recent set of data
                            var pastDataRaw = self.responseData[1]
                            //Parse out the scores
                            var pastData = pastDataRaw.valueForKeyPath("estimates.value")
                            
                            //Store the scores in past and current candidate variables
                            
                            //Cruz
                            cruzCurrent = latestData![2] as! Double
                            cruzPast = pastData![2] as! Double
                            self.cruzPerformance = cruzCurrent - cruzPast
                            //Round to one decimal place
                            self.cruzPerformance = self.cruzPerformance.roundToPlaces(1)
                            print("cruzCurrent:\(cruzCurrent)")
                            print("cruzPast:\(cruzPast)")
                            print("cruzPerformance:\(self.cruzPerformance)")
                            
                            //Trump
                            trumpCurrent = latestData![3] as! Double
                            trumpPast = pastData![3] as! Double
                            self.trumpPerformance = trumpCurrent - trumpPast
                            //Round to one decimal place
                            self.trumpPerformance = self.trumpPerformance.roundToPlaces(1)
                            print("trumpCurrent:\(trumpCurrent)")
                            print("trumpPast:\(trumpPast)")
                            print("trumpPerformance:\(self.trumpPerformance)")
                            
                            //Kasich
                            kasichCurrent = latestData![4] as! Double
                            kasichPast = pastData![4] as! Double
                            self.kasichPerformance = kasichCurrent - kasichPast
                            //Round to one decimal place
                            self.kasichPerformance = self.kasichPerformance.roundToPlaces(1)
                            print("kasichCurrent:\(kasichCurrent)")
                            print("kasichPast:\(kasichPast)")
                            print("kasichPerformance:\(self.trumpPerformance)")
                            
                            //Populating performance
                            self.performance = [self.berniePerformance, self.hillaryPerformance, self.cruzPerformance, self.trumpPerformance, self.kasichPerformance]
                            print("performance after load\(self.performance)")
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
