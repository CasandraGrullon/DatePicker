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
        
        
        //configure datePicker
        eventDatePicker.minimumDate = Date()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare for segue")
        //here is where we set up and pass event data to the next vc
        
        //1.we need an instance of the second vc
        //segue.source => where segue comes from
        //segue.destination is where the segue is going
        
        //need to type cast because the parent class doesnt know about the subclass
        guard let detailViewController = segue.destination as? DetailViewController else {
            return
        }
        //now we could set the event on the second vc
        detailViewController.event = event
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        event.date = sender.date
        //updating the event's date
        
    }
    

}

extension CreateEventViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        eventTextField.resignFirstResponder()
        //updating event's name
        event.name = eventTextField.text ?? ""
        return true
    }
}
