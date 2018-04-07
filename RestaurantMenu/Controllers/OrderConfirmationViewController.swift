//
//  OrderConfirmationViewController.swift
//  RestaurantMenu
//
//  Created by Руслан Акберов on 07.04.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

class OrderConfirmationViewController: UIViewController {
    
    @IBOutlet weak var timeRemainingLabel: UILabel!
    var minutes: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeRemainingLabel.text = "Thank you for your order! Your wait time is approximately \(minutes!) minutes."
    }
}
