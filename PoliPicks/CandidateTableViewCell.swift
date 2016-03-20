//
//  CandidateTableViewCell.swift
//  PoliPicks
//
//  Created by Justin Peng on 3/20/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class CandidateTableViewCell: UITableViewCell {
    
    @IBOutlet weak var candidatePortrait: UIImageView!
    @IBOutlet weak var candidateName: UILabel!
    @IBOutlet weak var candidatePick: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
