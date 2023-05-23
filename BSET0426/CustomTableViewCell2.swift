//
//  CustomTableViewCell2.swift
//  BSET0426
//
//  Created by hokyun Kim on 2023/04/26.
//

import UIKit

class CustomTableViewCell2: UITableViewCell {
    @IBOutlet weak var myKeywordLabel: UILabel!
    @IBOutlet weak var currentTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
