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
    @IBOutlet var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainLabel()
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
    
    
    // MARK: private methods
    private func setupMainLabel() {
        mainLabel.text = ""
        mainLabel.font = UIFont.systemFont(ofSize: 35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 3
    }
}

