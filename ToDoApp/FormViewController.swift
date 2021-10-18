//
//  FormViewController.swift
//  ToDoApp
//
//  Created by Rodrigo Leyva on 10/12/21.
//

import UIKit

protocol FormViewDelegate: AnyObject{
    func cancelButtonPressed(with viewContoller: UIViewController)
    func addItemPressed(title: String, notes: String, date: String)
}

class FormViewController: UIViewController {
    
    weak var formVCDelegate: FormViewDelegate?

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    var currentDate: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notesTextView.isScrollEnabled = false

        // Do any additional setup after loading the view.
    }
    func createAlert(message: String){
        let alert = UIAlertController(title: "Fields cannot be empty", message: "Please fill out the \(message) field in order to make a ToDo item", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
        self.present(alert, animated: true)
        
    }
    @IBAction func addItemPressed(_ sender: UIButton) {
        
        guard let title = titleTextField.text, title != "" else {
            createAlert(message: "Title")
            return
        }
        guard let notes = notesTextView.text, notes != "" else {
            createAlert(message: "Notes")
            return
        }
        
        if let currentDate = currentDate {
            formVCDelegate?.addItemPressed(title: title, notes: notes, date: currentDate)
            formVCDelegate?.cancelButtonPressed(with: self)
        }else{
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = DateFormatter.Style.short
            currentDate = dateFormatter.string(from: datePicker.date)
            
            formVCDelegate?.addItemPressed(title: title, notes: notes, date: currentDate!)
            formVCDelegate?.cancelButtonPressed(with: self)
        }
        
        
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        formVCDelegate?.cancelButtonPressed(with: self)
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = DateFormatter.Style.short

        currentDate = dateFormatter.string(from: datePicker.date)
    }
}
