//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by Hubert Cross on 10/19/18.
//  Copyright © 2018 Hubert Cross. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    //MARK: Properties
    var meals = [Meal]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // Load the sample data.
        loadSampleMeals()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // the number of rows is equal the number of elements in meals array
        return meals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MealTableViewCell"
        /*
         The dequeueReusableCell(withIdentifier:for:) method requests a cell from the table view. Instead of creating new cells and deleting old cells as the user scrolls, the table tries to reuse the cells when possible. If no cells are available, dequeueReusableCell(withIdentifier:for:) instantiates a new one; however, as cells scroll off the scene, they are reused. The identifier tells dequeueReusableCell(withIdentifier:for:) which type of cell it should create or reuse.
         */
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // guard let safely unwraps the optional returned by dequeue
        // as? MealTableViewCell is a downcast
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        // fetch the appropriate meal fom the meals array
        let meal = meals[indexPath.row]
        
        cell.mealLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating
        
        // Configure the cell...

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    //MARK: Private Methods
    private func loadSampleMeals() {
        let photo1 = UIImage(named: "gallopinto")
        let photo2 = UIImage(named: "quesillo")
        let photo3 = UIImage(named: "nacatamal")
        
        guard let meal1 = Meal(name: "Gallopinto", photo: photo1, rating: 4)
            else {
                fatalError("Unable to instantiate meal1")
        }
        guard let meal2 = Meal(name: "Quesillo", photo: photo2, rating: 3)
            else {
                fatalError("Unable to instantiate meal2")
        }
        guard let meal3 = Meal(name: "Nacatamal", photo: photo3, rating: 5)
            else {
                fatalError("Unable to instantiate meal3")
        }
        
        self.meals += [meal1, meal2, meal3]
        
        
    }
    
}
