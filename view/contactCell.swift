//
//  contactCell.swift
//  ContactUsingModel
//
//  Created by Cumulations on 26/02/19.
//  Copyright © 2019 Cumulations. All rights reserved.
//

import UIKit

class contactCell: UITableViewCell {

    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var personImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
