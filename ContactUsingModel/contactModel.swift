//
//  contactModel.swift
//  ContactUsingModel
//
//  Created by Cumulations on 26/02/19.
//  Copyright © 2019 Cumulations. All rights reserved.
//

import Foundation

class contactModel:NSObject{
    var firstName:String!
    var lastName:String!
    var phoneNumber:Int!
    var personImage:URL?
    var address:String?
    static var arrayConatactObjectsCreated:[contactModel]=[]
    
    init(firstName:String,lastName:String,phoneNumber:Int,personImage:URL,address:String) {
        self.firstName=firstName
        self.lastName=lastName
        self.personImage=personImage
        self.phoneNumber=phoneNumber
        self.address=address
      
    
    }
    override init() {
        super.init()
    }
    func refreshArrayOfContact()->[contactModel]{
        return contactModel.arrayConatactObjectsCreated
    }
    
    
    
//    init(contactDictionary:[String:Any]) {
//        self.firstName=firstName
//        self.lastName=lastName
//        self.personImage=personImage
//        self.phoneNumber=phoneNumber
//        self.address=address
//    }
//
}
