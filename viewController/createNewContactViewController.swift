//
//  createNewContactViewController.swift
//  ContactUsingModel
//
//  Created by Cumulations on 26/02/19.
//  Copyright © 2019 Cumulations. All rights reserved.
//

import Foundation
import UIKit

class CreateNewContact:UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    var optedImageName:String?
    var optedImage:UIImage?
    
    
    @IBOutlet weak var addButtonImage: UIButton!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBAction func addImageButton(_ sender: UIButton) {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        image.allowsEditing = false
        
        self.present(image, animated: true)
        {
            //After it is complete
        }
    }
   
//    func imagePickerController(_ picker: UIImagePickerController,
//                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//
//        if let image = info[.originalImage] as? UIImage {
//
//            addButtonImage.setTitle("", for: .normal)
//            addButtonImage.setBackgroundImage(image, for: .normal)
//            optedImage=image
//
//        }
//    }
    var imagePath:URL?
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    //obtaining saving path
    let fileManager = FileManager.default
    let documentsPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
    imagePath = documentsPath?.appendingPathComponent("image.jpg")
    
    // extract image from the picker and save it
    if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        
        let imageData = pickedImage.jpegData(compressionQuality: 0.75)
        try! imageData?.write(to: imagePath!)
        //---------------------->
        let data = NSData(contentsOf:imagePath!)
        if data != nil {
            optedImage = UIImage(data:data! as Data)
        }
        
        
        addButtonImage.setBackgroundImage(optedImage as! UIImage, for: .normal)
        addButtonImage.setTitle("", for: .normal)
        print(imagePath!)
    }
self.dismiss(animated: true, completion: nil)
}
    
    
    
    @IBAction func createNewContactButton(_ sender: UIButton) {
        
        if imagePath == nil{
            imagePath = URL(fileURLWithPath: "")
        }
        
        let contactObject=contactModel(firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, phoneNumber: Int(phoneNumberTextField.text!) ?? 0, personImage: imagePath!, address: addressTextField.text!)

        contactModel.arrayConatactObjectsCreated.append(contactObject)
        
        self.navigationController?.popViewController(animated: true)
        
    
    }
}
