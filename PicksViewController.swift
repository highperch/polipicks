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
    
    var images = ["bernie-sanders", "hillary-clinton", "donald-trump", "john-kasich", "marco-rubio"]
    var names = ["Bernie Sanders", "Hillary Clinton", "Donald Trump", "John Kasich", "Marco Rubio"]
    var picks: [Bool] = [berniePick, hillaryPick, donaldPick, johnPick, marcoPick]
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var candidateImage: UIImageView!
    @IBOutlet weak var candidateName: UILabel!
    
    func madePick() {
        pickIndex = pickIndex + 1
        candidateImage.image = UIImage(named: images[pickIndex])
        candidateName.text = names[pickIndex]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //cardView.layer.shadowOffset = CGSizeMake(5,1)
        cardView.layer.shadowRadius = 1
        cardView.layer.shadowOpacity = 1
        
        pickIndex = 0
        candidateImage.image = UIImage(named: images[pickIndex])
        candidateName.text = names[pickIndex]
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
