//
//  CustomTableViewCell.swift
//  ScavengerHunt
//
//  Created by Mike Z on 12/8/20.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var enabledSwitch: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
