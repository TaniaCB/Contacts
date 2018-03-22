//
//  ContactCell.swift
//  Contacts
//
//  Created by Tania on 22/2/18.
//  Copyright © 2018 TaniaCB. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
