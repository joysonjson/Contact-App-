//
//  tableViewController.swift
//  ContactUsingModel
//
//  Created by Cumulations on 26/02/19.
//  Copyright © 2019 Cumulations. All rights reserved.
//

import Foundation
import UIKit

class ContactsTableViewController:UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var contactTableViewOutlet: UITableView!
    //@IBOutlet weak var contactsTableViewOutlet: UITableView!
   
var cellId="cell"
var dictionaryOfConstacts = [String:[contactModel]]()
var arrayOfSections=[String]()
var arrayOfRefreshedContacs = [contactModel]()
var obj=contactModel()

@IBAction func createNewContactButton(_ sender: UIBarButtonItem) {
    let detailedVc = UIStoryboard.init(name : "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CreateNewContact") as!
    CreateNewContact
    
    self.navigationController?.pushViewController(detailedVc, animated: true)
}
    
    
    
    
//------------dictionary----------->

func refreshDictionary(){
    print("refreshDictionary ")
    dictionaryOfConstacts.removeAll()

    arrayOfRefreshedContacs=obj.refreshArrayOfContact()
    print(arrayOfRefreshedContacs)
    print("before \(dictionaryOfConstacts)")
    for contactObject in arrayOfRefreshedContacs{
        print(contactObject.firstName)
        let firstLetter = String(contactObject.firstName.characters.first!).uppercased()
       
        
        if let present=dictionaryOfConstacts[firstLetter]{
            dictionaryOfConstacts[firstLetter]?.append(contactObject)//:UIImage(element)])
            
        }else{
            dictionaryOfConstacts[firstLetter]=[contactObject]
        }
    }
    arrayOfSections=dictionaryOfConstacts.keys.sorted()
    self.contactTableViewOutlet.reloadData()
    
}
    

override func viewDidLoad() {
    super.viewDidLoad()

}
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    refreshDictionary()
    print("viewWillAppear")

}

//No of sections
 func numberOfSections(in tableView: UITableView) -> Int {
        return arrayOfSections.count
}
    
//No of rows in each section
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let keyForRow=arrayOfSections[section]
    
    return dictionaryOfConstacts[keyForRow]?.count ?? 1

}

//    <---------section header and color------>

func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    print("willDisplayHeaderView")
    view.tintColor=UIColor.gray
}
func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
    print("titleForHeaderInSection\(section)")
arrayOfSections=dictionaryOfConstacts.keys.sorted()
    return arrayOfSections[section]
}
    
 //----------------------------------cell for row at----------------------------->
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let newCell=tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! contactCell
    let keyRequired=arrayOfSections[indexPath.section]
    let objectRequires=dictionaryOfConstacts[keyRequired]!
    newCell.personNameLabel.text=objectRequires[indexPath.row].firstName
    print(objectRequires[indexPath.row].firstName)
    print("cellForRowAt.....................")
    newCell.personNameLabel.textColor = .black
    newCell.personNameLabel.textAlignment = .left
    
    return newCell
}
    
//---------------------selecting row--------->
    
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let detailedVc = UIStoryboard.init(name : "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailedViewController") as! DetailedViewController
    print("didSelectRowAt \(indexPath.section)   \(indexPath.row)")
    let keyRequired=arrayOfSections[indexPath.section]
    let objectRequired=dictionaryOfConstacts[keyRequired]!

    detailedVc.personDetailsObject=objectRequired[indexPath.row]
    self.navigationController?.pushViewController(detailedVc, animated: true)
}

//----------------deleting a row and updating the view--------------------->
    
func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{

            let theKey=arrayOfSections[indexPath.section]
            
            let theArrayOfObjects=dictionaryOfConstacts[theKey]
            
            let theObjectRemoved=theArrayOfObjects![indexPath.row]
            
            if let index = contactModel.arrayConatactObjectsCreated.index(of: theObjectRemoved) {
                contactModel.arrayConatactObjectsCreated.remove(at: index)
                refreshDictionary()
            }
            
            
        }
    }
}


