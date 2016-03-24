//
//  LeaderboardViewController.swift
//  PoliPicks
//
//  Created by Justin Peng on 3/13/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class LeaderboardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var data = ["JP2GQ, California", "washington112, Pennsylvania", "patriot.eagle, Virginia", "make.america.great.again, Ohio", "bald.eagle.six, Florida", "team.america, Colorado"]
    var scores = ["50", "23", "19", "14", "11", "8"]
    //var data = [["username" : "washington112", "location" : "Pennsylvania", "score" : "23"], ["username" : "patriot.eagle", "location":"Virginia", "score":19], ["username":"make.america.great.again", "location": "Ohio", "score": 14], ["username":"bald.eagle.six", "location": "Florida", "score": 11], ["username":"team.america", "location": "Colorado", "score": 8]]
    
    var defaults = NSUserDefaults.standardUserDefaults()
    var totalScore: Int!
    var userState: String!
    var userName: String!
    
    @IBOutlet weak var leaderboardTableView: UITableView!
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tableViewCell", forIndexPath: indexPath) as! LeaderboardTableViewCell
        let userData = data[indexPath.row].componentsSeparatedByString(", ")
//        print(userData)
        cell.leaderboardTableViewName.text = userData.first
        cell.leaderboardTableViewLocation.text = userData.last
        if indexPath.row == 0 {
            cell.leaderboardTableViewProfilePicture.image = UIImage(named: "american_flag")
        } else {
            cell.leaderboardTableViewProfilePicture.image = UIImage(named: "ic_account_circle")
        }
        cell.leaderboardTableViewScore.text = scores[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func viewWillAppear(animated: Bool) {
        totalScore = defaults.integerForKey("totalScore")
        userState = defaults.stringForKey("userState")
        userName = defaults.stringForKey("userScreenName")
        leaderboardTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leaderboardTableView.delegate = self
        leaderboardTableView.dataSource = self
        leaderboardTableView.rowHeight = 60
        
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
