//
//  statusTableViewCell.swift
//  FCPS Alert
//
//  Created by william wright  on 12/17/15.
//  Copyright © 2015 A.R.C software and enginering. All rights reserved.
//

import UIKit

class statusTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cellimg: UIImageView!
    
    @IBOutlet weak var celldcs: UILabel!
    
    @IBOutlet weak var celldate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
