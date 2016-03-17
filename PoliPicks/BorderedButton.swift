//
//  BorderedButton.swift
//  PoliPicks
//
//  Created by Justin Peng on 3/16/16.
//  Copyright © 2016 Justin Peng. All rights reserved.
//

import UIKit

class BorderedButton: UIButton {
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        layer.cornerRadius = 5
        layer.borderWidth = 1.5
        layer.borderColor = UIColor.whiteColor().CGColor
    }

}
