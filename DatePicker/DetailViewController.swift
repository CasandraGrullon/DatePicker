//
//  DetailViewController.swift
//  DatePicker
//
//  Created by casandra grullon on 11/14/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var selectedDateLabel: UILabel!
    @IBOutlet weak var switchControl: UISwitch!
    
    //we need object(Event) from source viewcontroller => create event view controller
    var event : Event? // default value is nill

    //DateFormatter will help us format the Date object in a more readable format
    // lazy means we only use this variable when its needed.
    // gets created only the first time its needed
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        
        return formatter
    }() //calls this function (closure)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }

    func updateUI() {
        guard let date = event?.date else {
            return
        }
        
        selectedDateLabel.text = dateFormatter.string(from: date)
        
        //set switch position based on .willAttend == true or false.
        switchControl.isOn = event?.willAttend ?? false
        messageLabel.text = event?.name ?? "Event name not available."
    }

    @IBAction func rsvpChanged(_ sender: UISwitch) {
        
    }
    
}
