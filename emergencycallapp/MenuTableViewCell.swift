//
//  MenuTableViewCell.swift
//  emergencycallapp
//
//  Created by Hasan on 6/20/18.
//  Copyright © 2018 Axiom HK 13. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var labeltext: UILabel!
    @IBOutlet weak var Picure: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
