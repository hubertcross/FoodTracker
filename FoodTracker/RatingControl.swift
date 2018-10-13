//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Hubert Cross on 10/12/18.
//  Copyright © 2018 Hubert Cross. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {
    //MARK: Properties
    private var pressCount: Int = 0;
    // List of buttons
    private var ratingButtons = [UIButton]()
    var rating = 0
    
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
    }
    
    //MARK: Private Methods
    // Make sure the butons are added regardless of which initializer is called. Call this from both initializers.
    private func setupButtons() {
        let button = UIButton()
        button.backgroundColor = UIColor.blue
        // Constraints
        // Disable the button's automatically generated constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        // replace these constraints with our own since we're using Auto Layout
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        // Setup the buton action
        button.addTarget(self, action:
            #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
        
        // Add thebutton to the stack
        addArrangedSubview(button)
    }
    
    
}
