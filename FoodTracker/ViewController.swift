//
//  ViewController.swift
//  FoodTracker
//
//  Created by Hubert Cross on 10/8/18.
//  Copyright © 2018 Hubert Cross. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK: Properties

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field's user input through delegate callbacks.
        nameTextField.delegate = self // self is like 'this'
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hidethe keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    //MARK: UIImagPickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // animates the dismissal, completion callback is nill
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original
        // Wrap the optional returned by the dictionary and cast as UIImage object
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
            else {
//                 fatalError logs error message to console and terminates app
                fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
            }
        
        // set photoImageView to display the selected image
        photoImageView.image = selectedImage
        
        // dismiss the picker
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Actions
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard if the user taps the image view while typing in the ext field by resigning that view's FirstResponder
        nameTextField.resignFirstResponder()

        // UIImagePickerController is a view controller that lets a user pick media from their photo library
        let imagePickerController = UIImagePickerController()
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary

        // The type of imagePickerConroller.sourceType is known to be UIImagePickerControllerSourceType, which is an *enumeration*. This means you can write its value as the abbreviated form .photolibrary instead of UIImagePickerControllerSourceType.photolibrary.
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self

        // Implicitly called on 'self' - asks ViewController to present the view controller defined by imagePickerController
        // Completion parameter refers to a 'completion handler' - a piece of code that executes after this method completes, sort of like  a callback, which is left nil for our case.
        present(imagePickerController, animated: true, completion: nil)
    }
}

