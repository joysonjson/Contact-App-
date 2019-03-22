//
//  DetailedViewController.swift
//  ContactUsingModel
//
//  Created by Cumulations on 27/02/19.
//  Copyright © 2019 Cumulations. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    @IBOutlet weak var peronImageView: UIImageView!
    
    @IBOutlet weak var firstNameTextLabel: UILabel!
    
    @IBOutlet weak var lastNameTextLabel: UILabel!
   
    
    @IBOutlet weak var personPhoneNumberLabel: UILabel!
    
    @IBOutlet weak var personAddressLabel: UILabel!
    
    var personDetailsObject=contactModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let data = NSData(contentsOf:personDetailsObject.personImage!)
        if data != nil {
            peronImageView.image = UIImage(data:data! as Data)
        }
        else{
            peronImageView.image=UIImage(named:"defaultImage")
        }
        
        
        personPhoneNumberLabel.text=String(personDetailsObject.phoneNumber)
        personPhoneNumberLabel.textColor = .blue
        
        personAddressLabel.text=personDetailsObject.address
        personAddressLabel.textColor = .blue
        
        firstNameTextLabel.text=personDetailsObject.firstName
        firstNameTextLabel.textColor = .blue
        
        lastNameTextLabel.text=personDetailsObject.lastName
        lastNameTextLabel.textColor = .blue
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    


}
