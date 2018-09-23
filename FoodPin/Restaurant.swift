    //
//  Restaurant.swift
//  FoodPin
//
//  Created by Andres Rambar on 6/24/18.
//  Copyright © 2018 Rambar. All rights reserved.
//

import Foundation

    class Restaurant {
        var name = ""
        var type = ""
        var location = ""
        var image = ""
        var isVisited = false
        var phone = ""
        
        var rating = ""
        
        init(name:String, type:String, location:String, phone:String, image:String, isVisited:Bool) {
            self.name = name
            self.type = type
            self.location = location
            self.image = image
            self.isVisited = isVisited
            self.phone = phone
        }
    }
