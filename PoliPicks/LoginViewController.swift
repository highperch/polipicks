//
//  LoginViewController.swift
//  PoliPicks
//
//  Created by Justin Peng on 3/9/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var taglineText: UILabel!
    @IBOutlet weak var portrait1: UIImageView!
    @IBOutlet weak var portrait2: UIImageView!
    @IBOutlet weak var portrait3: UIImageView!
    @IBOutlet weak var portrait4: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.12, green: 0.71, blue: 0.93, alpha: 1)
        titleText.textColor = UIColor(white: 1, alpha: 1)
        taglineText.textColor = UIColor(white: 1, alpha: 1)
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
