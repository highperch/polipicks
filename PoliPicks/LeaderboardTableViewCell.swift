//
//  LeaderboardTableViewCell.swift
//  PoliPicks
//
//  Created by Justin Peng on 3/14/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class LeaderboardTableViewCell: UITableViewCell {

    @IBOutlet weak var leaderboardTableViewProfilePicture: UIImageView!
    @IBOutlet weak var leaderboardTableViewName: UILabel!
    @IBOutlet weak var leaderboardTableViewLocation: UILabel!
    @IBOutlet weak var leaderboardTableViewScore: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
