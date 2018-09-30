//
//  AddRestaurantTableViewController.swift
//  FoodPin
//
//  Created by Andres Rambar on 9/3/18.
//  Copyright © 2018 Rambar. All rights reserved.
//

import UIKit
import CoreData

class AddRestaurantTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var phoneField:UITextField!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!

    
    var restaurant:RestaurantMO!
    var isVisited:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0){
           if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let imagePicker = UIImagePickerController();
                imagePicker.delegate = self
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
                present(imagePicker, animated: true, completion: nil)
                
            }
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            photoImageView.image = selectedImage
            photoImageView.contentMode = .scaleAspectFill
            photoImageView.clipsToBounds = true
        }
        
        let leadingConstraint = NSLayoutConstraint(item: photoImageView, attribute: .leading, relatedBy: .equal, toItem: photoImageView.superview, attribute: .leading, multiplier: 1, constant: 0)
        leadingConstraint.isActive = true
        
        let trailingConstraint = NSLayoutConstraint(item: photoImageView,attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal,toItem: photoImageView.superview, attribute: NSLayoutAttribute.trailing,
                                                    multiplier: 1, constant: 0)
        trailingConstraint.isActive = true
        
        let topConstraint = NSLayoutConstraint(item: photoImageView, attribute:
            NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem:
            photoImageView.superview, attribute: NSLayoutAttribute.top, multiplier: 1,constant: 0)
        topConstraint.isActive = true
        
        let bottomConstraint = NSLayoutConstraint(item: photoImageView, attribute:
            NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem:
            photoImageView.superview, attribute: NSLayoutAttribute.bottom,multiplier: 1,constant: 0)
        bottomConstraint.isActive = true

        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveNewRestaurant(_ sender: UIBarButtonItem) {
        let nameFieldText = self.nameField.text!
        let locationFieldText = self.locationField.text!
        let typeFieldText = self.typeField.text!
        let phoneFieldText = self.phoneField.text!
        if nameFieldText.isEmpty{
            showAlert(title: "Name field is empty", message: "We can't proceed because name field is empty and this is a required field")
        }else if typeFieldText.isEmpty{
            showAlert(title: "Type field is empty", message: "We can't proceed because type field is empty and this is a required field")
        }else if locationFieldText.isEmpty{
            showAlert(title: "Location field is empty", message: "We can't proceed because location field is empty and this is a required field")
        }else{
            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
                restaurant = RestaurantMO(context: appDelegate.persistentContainer.viewContext)
                restaurant.name = nameFieldText
                restaurant.type = typeFieldText
                restaurant.location = locationFieldText
                restaurant.phone = phoneFieldText
                restaurant.isVisited = isVisited
                if let restaurantImage = photoImageView.image{
                    if let imageData = UIImagePNGRepresentation(restaurantImage){
                        restaurant.image = NSData(data: imageData) as Data
                    }
                }
                print("Saving data")
                appDelegate.saveContext()
            }
        }
        
    }
   
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.currentTitle == "YES"{
            isVisited = true
            self.yesButton.backgroundColor = UIColor.red
            self.noButton.backgroundColor = UIColor.gray
        }else{
            isVisited = false
            self.noButton.backgroundColor = UIColor.red
            self.yesButton.backgroundColor = UIColor.gray
        }
    }
    func showAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
        self.present(alert, animated: true)
    }

    // MARK: - Table view data sourc
}
