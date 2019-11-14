//
//  ViewController.swift
//  DatePicker
//
//  Created by casandra grullon on 11/14/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController {

    @IBOutlet weak var eventTextField: UITextField!
    @IBOutlet weak var eventDatePicker: UIDatePicker!
    @IBOutlet weak var createEventButton: UIButton!
    @IBOutlet weak var rsvpLabel: UILabel!
    
    var event : Event! {
        didSet {
            //when event is changed, update UI
            if event.willAttend {
                //update label and button
                rsvpLabel.text = "RSVP YES"
                createEventButton.setTitle("View Event", for: .normal)
            } else {
                rsvpLabel.text = "RSVP NO"
                createEventButton.setTitle("RSVP to Event", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventTextField.delegate = self
        //Date() creates/instantiates a new Date object with the current date and time.
        event = Event(name: "event name not set", willAttend: false, date: Date())
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare for segue")
        //here is where we set up and pass event data to the next vc
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
    }
    

}

extension CreateEventViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        eventTextField.resignFirstResponder()
        return true
    }
}
