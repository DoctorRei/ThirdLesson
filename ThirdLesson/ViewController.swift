//
//  ViewController.swift
//  ThirdLesson
//
//  Created by Акира on 24.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: IBOutlets setup
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var slider: UISlider!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var textFieldFirst: UITextField!
    @IBOutlet var dateWheelText: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlider()
        setupMainLabel()
        textFieldFirst.placeholder = "Enter your name"
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
    }
    // MARK: IBActions
    @IBAction func segmentedControlAction() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "First segment"
            mainLabel.textColor = .blue
        case 1:
            mainLabel.text = "Seccond segment"
            mainLabel.textColor = .gray
        default:
            mainLabel.text = "Third segment"
            mainLabel.textColor = .red
        }
    }
    @IBAction func sliderAction() {
        mainLabel.text = slider.value.formatted()
    }
    @IBAction func tapButton() {
        guard let inputText = textFieldFirst.text, !inputText.isEmpty else {
            showAllert(withTitle: "Sry", andMessage: "We need your name")
            
            return
        }
        if let _ = Double(inputText) {
            showAllert(withTitle: "Sry", andMessage: "We need your name")
        }
        mainLabel.text = textFieldFirst.text
    }
    @IBAction func dateWheel() {
        mainLabel.text = dateWheelText.date.formatted()
    }
    
    
    // MARK: private methods
    private func setupMainLabel() {
        mainLabel.text = slider.value.formatted()
        mainLabel.font = UIFont.systemFont(ofSize: 35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 3
    }
    private func setupSlider() {
        slider.value = 1
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.minimumTrackTintColor = .red
        slider.maximumTrackTintColor = .gray
        slider.thumbTintColor = .black
    }
    
    
}

extension ViewController {
    private func showAllert(withTitle title: String, andMessage: String) {
        let alertMessage = UIAlertController(title: title, message: andMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: { _ in
            self.textFieldFirst.text = ""
            self.mainLabel.text = ""
        })
        alertMessage.addAction(okAction)
        present(alertMessage, animated: true)
    }
}
