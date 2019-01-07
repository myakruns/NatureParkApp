//
//  BirdTableViewCell.swift
//  CNPGuide
//
//  Created by Austin Rath on 4/30/18.
//  Copyright © 2018 Austin Rath. All rights reserved.
//
//  Updated by Mike Yakubovsky on 9/30/18.
//

import UIKit

class BirdTableViewCell: UITableViewCell {

    @IBOutlet weak var birdTableImage: UIImageView!
    @IBOutlet weak var birdTableLabel: UILabel!
    @IBOutlet weak var birdSightedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
