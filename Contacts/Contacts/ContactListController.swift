//
//  ContactListController.swift
//  Contacts
//
//  Created by Tania on 22/2/18.
//  Copyright © 2018 TaniaCB. All rights reserved.
//

import UIKit

//get the first character from the contact name.
extension Contact{
    var firstLetter: String{
        return String(firstName.prefix(1))
    }
}

extension ContactsSource{
    static var sortedUniqueLetters : [String]{
        let firstLetters = contacts.map{ $0.firstLetter } //get the first character of each contact
        let uniqueLetters = Set(firstLetters) //only get the character from the exist contact without duplicates.
        
        return Array(uniqueLetters).sorted() //sort array by first character name
    }
    
    static var sectionedContacts: [[Contact]]{
        return sortedUniqueLetters.map{firstLetter in
            let filteredContacts = contacts.filter{ $0.firstLetter == firstLetter }
            //filter the contacts that their first character is the same that the uniqueLetters array.
            
            return filteredContacts.sorted(by: {$0.firstName < $1.firstName}) //compare by alphabetical order
        }
    }
}

class ContactListController: UITableViewController {
    var sectionedContacts = ContactsSource.sectionedContacts
    var titleHeaders = ContactsSource.sortedUniqueLetters
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionedContacts.count //number of sections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sectionedContacts[section].count //how many contacts there are with this section number.
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleHeaders[section] //group the sections by alphabetical array.
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return titleHeaders //we put the alphabet on the right side, typical of the iPhone to go to a section more quickly
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let contactCell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as? ContactCell else{
            fatalError()
        }
        
        let contact = sectionedContacts[indexPath.section][indexPath.row]
        
        contactCell.nameLabel.text = contact.firstName
        contactCell.cityLabel.text = contact.city
        contactCell.profileImageView.image = contact.image
        
        return contactCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showContact" {
            if let indexPath = tableView.indexPathForSelectedRow{
                let contact = sectionedContacts[indexPath.section][indexPath.row]
                
                guard let navigationController = segue.destination as? UINavigationController,
                let contactDetailController = navigationController.topViewController as? ContactDetailController
                    else{
                        return
                }
                
                contactDetailController.contact = contact
            }
        }
    }
}
