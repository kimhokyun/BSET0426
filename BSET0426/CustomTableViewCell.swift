//
//  CustomTableViewCell.swift
//  BSET0426
//
//  Created by hokyun Kim on 2023/04/26.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
/*            cell.nameLabel.text = member.name
 cell.imageView?.image = UIImage(named: member.imageFile)
 */
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageFileImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
