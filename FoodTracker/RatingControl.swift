//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Hubert Cross on 10/12/18.
//  Copyright © 2018 Hubert Cross. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    //MARK: Properties
    private var pressCount: Int = 0;
    // List of buttons
    private var ratingButtons = [UIButton]()
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    //MARK: Initialization
    // This initializer is used during design, programatically
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    // This initializer is used during runtime, loading from storyboard
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Button action
    @objc func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍. pressCount: " + String(pressCount))
        pressCount += 1;
        
        // This makes sure the button object clicked is in the array, and gets its index in the array too
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        // Calculate the rating of the selected button, the "number of stars"
        let selectedRating = index + 1
        
        if selectedRating == rating {
            // if ths selected star represents the current rating, clear the rating to 0.
            rating = 0
        } else {
            rating = selectedRating
        }
        
    }
    
    //MARK: Private Methods
    // Make sure the butons are added regardless of which initializer is called. Call this from both initializers.
    private func setupButtons() {
        // clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar.png", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar.png", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar.png", in: bundle, compatibleWith: self.traitCollection)
        
        
        
        for _ in 0 ..< starCount {
            let button = UIButton()
//            button.backgroundColor = UIColor.blue
            // Set the button images, these states belong to the UIButton class
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            // Constraints
            // Disable the button's automatically generated constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            // replace these constraints with our own since we're using Auto Layout
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Setup the buton action
            button.addTarget(self, action:
                #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add thebutton to the stack
            addArrangedSubview(button)
            ratingButtons.append(button)
        }
        updateButtonSelectionStates()
    }
    
    private func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
        }
    }
    
    
}
