//
//  ContactDetailController.swift
//  Contacts
//
//  Created by Tania on 22/2/18.
//  Copyright © 2018 TaniaCB. All rights reserved.
//

import UIKit

class ContactDetailController: UITableViewController {
    var contact: Contact?
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipCodeLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameCompleteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayContactInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
    func displayContactInfo(){
        guard let contact = contact else{
                return
        }
        
        phoneLabel.text         = contact.phone
        emailLabel.text         = contact.email
        streetLabel.text        = contact.street
        cityLabel.text          = contact.city
        stateLabel.text         = contact.state
        zipCodeLabel.text       = contact.zip
        nameCompleteLabel.text  = "\(contact.firstName) \(contact.lastName)"
        profileImageView.image  = contact.image
    }       
}
