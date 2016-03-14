//
//  TabBarViewController.swift
//  PoliPicks
//
//  Created by Justin Peng on 3/7/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    //Declare variables for the VCs associated with the tab bar controller
    var picksViewController: UIViewController!
    var leaderboardViewController: UIViewController!
    var profileViewController: UIViewController!
    //Array of VCs for tab bar view controller
    var viewControllers: [UIViewController]!
    //Default selected ViewController
    var selectedIndex: Int = 0

    
    @IBOutlet var buttons: [UIButton]!
    //Tab bar button outlets
    @IBOutlet weak var picksButton: UIButton!
    @IBOutlet weak var leaderboardButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!
    
    //Content view outlet
    @IBOutlet weak var contentView: UIView!
    
    @IBAction func didPressTab(sender: UIButton) {
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        
        //De-select previous button, remove previous ViewController
        buttons[previousIndex].selected = false
        let previousVC = viewControllers[previousIndex]
        previousVC.willMoveToParentViewController(nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        //Select current button, add current ViewController
        sender.selected = true
        let vc = viewControllers[selectedIndex]
        addChildViewController(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMoveToParentViewController(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Declare storyboard for custom tab bar controller
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        picksViewController = storyboard.instantiateViewControllerWithIdentifier("PicksViewController")
        leaderboardViewController = storyboard.instantiateViewControllerWithIdentifier("LeaderboardViewController")
        profileViewController = storyboard.instantiateViewControllerWithIdentifier("ProfileViewController")
        viewControllers = [picksViewController, leaderboardViewController, profileViewController]
        
        //Set up button array
        buttons = [picksButton, leaderboardButton, profileButton]
        buttons[selectedIndex].selected = true
        didPressTab(buttons[selectedIndex])

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
