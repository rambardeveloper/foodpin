//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Andres Rambar on 6/14/18.
//  Copyright © 2018 Rambar. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurants:[Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F,72 Po Hing Fong, Sheung Wan, Hong Kong", phone: "232-923423", image:"cafedeadend.jpg", isVisited: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", phone: "348-233423", image: "homei.jpg", isVisited: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Shop B, 18 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phone: "354-243523", image: "teakha.jpg", isVisited: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Shop B, 20 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phone: "453-333423", image: "cafeloisl.jpg", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "24 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phone: "983-284334", image: "petiteoyster.jpg", isVisited: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Shop JK., 200 Hollywood Road, SOHO, Sheun Wan, Hong Kong", phone: "232-434222", image: "forkeerestaurant.jpg", isVisited: false),
        Restaurant(name: "Po's Atelier", type:"Bakery", location: "G/F, 62 Po Hing Fong, Sheung Wan, Hong Kong", phone: "234-834322", image: "posatelier.jpg", isVisited: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "633 Bourke St Sydney New South Wales 2010 Surry Hills", phone: "982-434343", image: "bourkestreetbakery.jpg", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "412-414 George St Sydney New South Wales", phone: "734-232323", image: "haighschocolate.jpg", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Shop 1 61 York St Sydney New South Wales", phone: "872-734343", image: "palominoespresso.jpg", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location: "95 1st Ave New    York, NY 10003", phone: "343-233221", image: "upstate.jpg", isVisited: false),
        Restaurant(name: "Traif", type: "American", location: "229 S 4th St Brooklyn, NY 11211", phone: "985-723623", image: "traif.jpg", isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "445 Graham Ave Brooklyn, NY 11211", phone: "455-232345", image:"grahamavenuemeats.jpg", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "413 Graham Ave Brooklyn, NY 11211", phone: "434-232322", image: "wafflewolf.jpg", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "18 Bedford Ave Brooklyn, NY 11222", phone: "343-234553", image: "fiveleaves.jpg", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "Sunset Park 4601 4th Ave Brooklyn, NY 11220", phone: "342-455433", image: "cafelore.jpg", isVisited: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "308 E 6th St New York, NY 10003", phone: "643-332323", image: "confessional.jpg", isVisited: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "54 Frith Street London W1D 4SL United Kingdom", phone: "542-343434", image: "barrafina.jpg", isVisited: false),
       Restaurant(name: "Donostia", type: "Spanish", location: "10 Seymour Place London W1H 7ND United Kingdom", phone: "722-232323", image: "donostia.jpg",
                            isVisited: false),
       Restaurant(name: "Royal Oak", type: "British", location: "2 Regency Street London SW1P 4BZ United Kingdom", phone: "343-988834", image: "royaloak.jpg", isVisited: false),
       Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "22 Charlwood Street London SW1V 2DY Pimlico", phone: "432-344050", image: "caskpubkitchen.jpg", isVisited: false)
    ]
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent // .default
    }
    
    let cellIdentifier = "RestaurantCell"
    
    var restaurantIsVisited = Array(repeating: false, count: 21)

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableViewAutomaticDimension
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
        cell.nameLabel.text=restaurants[indexPath.row].name
        cell.imageCell.image = UIImage(named: restaurants[indexPath.row].image)
        cell.imageCell.layer.cornerRadius = 30.0
        cell.imageCell.clipsToBounds = true
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.typeLabel.text = restaurants[indexPath.row].type
        if(restaurants[indexPath.row].isVisited){
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
        return cell
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationController = segue.destination as! RestaurantDetailViewController
                destinationController.restaurant.image = restaurants[indexPath.row].image
                destinationController.restaurant.name = restaurants[indexPath.row].name
                destinationController.restaurant.location = restaurants[indexPath.row].location
                destinationController.restaurant.type = restaurants[indexPath.row].type
                destinationController.restaurant.phone = restaurants[indexPath.row].phone
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            restaurants.remove(at: indexPath.row)
        }
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //Social Sharing button
        let shareAction = UITableViewRowAction(style: .normal, title: "Share", handler: {
            (action, indexPath) -> Void in
                let defaultText = "Just cheking in at " + self.restaurants[indexPath.row].name
            
                if let imageToShare = UIImage(named: self.restaurants[indexPath.row].image){
                    let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                    self.present(activityController, animated: true, completion: nil)
                   
                }else{
                    let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
                    self.present(activityController, animated: true, completion: nil)
                }
        })
        
        shareAction.backgroundColor = UIColor(red: 48.0/255.0, green: 173.0/255.0,
                                              blue: 99.0/255.0, alpha: 1.0)
        
        
        //Delete buton
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete", handler: {
            (action, indexPath)->Void in
                self.restaurants.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .fade)
        })
        
        deleteAction.backgroundColor = UIColor(displayP3Red: 254.0/255.0, green: 5.0/255.0, blue: 10.0/255.0, alpha: 1.0)
        
        return [shareAction, deleteAction]
    }
    
    @IBAction func unwindToHomeScreen(segue:UIStoryboardSegue){
        
    }

}
