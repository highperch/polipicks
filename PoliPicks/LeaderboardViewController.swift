//
//  LeaderboardViewController.swift
//  PoliPicks
//
//  Created by Justin Peng on 3/13/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class LeaderboardViewController: UIViewController, UITableViewDataSource {
    
    let data: [[String:Any]] = [["username": "washington112", "location": "Pennsylvania", "score": 23], ["username":"patriot.eagle", "location":"Virginia", "score":19], ["username":"make.america.great.again", "location": "Ohio", "score": 14], ["username":"bald.eagle.six", "location": "Florida", "score": 11], ["username":"team.america", "location": "Colorado", "score": 8]]
    
    @IBOutlet weak var leaderboardTableView: UITableView!
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tableViewCell", forIndexPath: indexPath) as! LeaderboardTableViewCell
        let userData = data[indexPath.row]
        print(userData)
        //cell.leaderboardTableViewName.text
        //cell.leaderboardTableViewLocation.text = userData.valueForKeyPath("location")
        //cell.leaderboardTableViewScore.text = userData.valueForKeyPath("score")
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        leaderboardTableView.dataSource = self
        leaderboardTableView.rowHeight = 100
        
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
