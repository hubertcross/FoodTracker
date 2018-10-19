//
//  Meal.swift
//  FoodTracker
//
//  Created by Hubert Cross on 10/14/18.
//  Copyright © 2018 Hubert Cross. All rights reserved.
//

import Foundation
import UIKit

class Meal {
    
    //MARK: Properties
    var name: String
    var photo: UIImage? // ? means it's optional
    var rating: Int
    
    // This is like a constructor in Java
    // this ? after init means it's a failable initializer (can return nil if some conditions are not met)
    init?(name: String, photo: UIImage?, rating: Int) {
        
        guard !name.isEmpty else {
            return nil
        }
        
        // Initialization should fail if there is no name or if the rating is negative.
        guard rating <= 5 && rating >= 0 else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
    
    
    
}
