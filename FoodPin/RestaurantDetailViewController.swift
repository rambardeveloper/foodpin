//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Andres Rambar on 6/21/18.
//  Copyright © 2018 Rambar. All rights reserved.
//

import UIKit
import MapKit;

class RestaurantDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellIdentifier = "detailCell"
    
    @IBOutlet var restaurantImageView:UIImageView!
    @IBOutlet var mapView:MKMapView!
    var restaurant:RestaurantMO!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
   
    
    @IBOutlet var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantImageView.image = UIImage(data: restaurant.image!)
        tableView.backgroundColor = UIColor(red: 10.0/255.0, green: 210.0/255.0, blue: 210.0/255.0, alpha: 0.2)
        tableView.separatorColor = UIColor(red: 10.0/255.0, green: 210.0/255.0, blue: 210.0/255.0, alpha: 0.2)
        
        title = restaurant.name
        
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension

        //Mapa
        let geoCoder = CLGeocoder()
        print("Location: \(restaurant.location!)")
       
        geoCoder.geocodeAddressString(restaurant.location!, completionHandler: {
                (placemarks, error) in
                if error != nil {
                    print("Error: \(error!)")
                    return
                }else{
                    print("Placemark \(placemarks!)")
                }
                if let placemarks = placemarks{
                    
                    let placemark = placemarks[0]
                    print("Placemark: \(placemark)")
                    let annotation = MKPointAnnotation()
                    
                    if let location  = placemark.location{
                        annotation.coordinate = location.coordinate
                        self.mapView.addAnnotation(annotation)
                        let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 250, 250)
                        self.mapView.setRegion(region, animated: false)
                    }
                }
            }
        )
        let tabGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showMap))
        mapView.addGestureRecognizer(tabGestureRecognizer)
    }

    
    @objc func showMap(){
        performSegue(withIdentifier: "showMap", sender: self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent // .default
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    @IBAction func ratingButtonAction(segue: UIStoryboardSegue){
        if let rating = segue.identifier{
            restaurant.isVisited = true
            switch rating{
                case "great":
                    restaurant.rating = "Absoluteley love it! Must try"
                case "good":
                    restaurant.rating = "Pretty Good"
                case "dislike":
                    restaurant.rating = "I don't like it"
                default:
                    break
            }
        }
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            appDelegate.saveContext()
        }
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ReviewViewController{
            let data = segue.destination as! ReviewViewController
            data.restaurant = self.restaurant
        }else if segue.destination is MapViewController{
            let data = segue.destination as! MapViewController
            data.restaurant = self.restaurant
        }
    }
    
    @IBAction func close(segue:UIStoryboardSegue){
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantDetailTableViewCell
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Name"
            cell.valueLabel.text =  restaurant.name
        case 1:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text =  restaurant.type
        case 2:
            cell.fieldLabel.text = "Location"
            cell.valueLabel.text =  restaurant.location
        case 3:
            cell.fieldLabel.text = "Been here"
            cell.valueLabel.text =  (restaurant.isVisited) ? "Yes, I've been here before. \(String(describing: restaurant.rating))": "No"
        case 4:
            cell.fieldLabel.text = "Phone"
            cell.valueLabel.text =  restaurant.phone
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
            
        }
        cell.backgroundColor = UIColor.clear
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
