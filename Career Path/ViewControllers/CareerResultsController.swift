//
//  ResultsController.swift
//  Career Path
//
//  Created by mikael on 01/12/2019.
//  Copyright © 2019 Team Awesome. All rights reserved.
//

import UIKit

// test controller for displaying results

class CareerResultsController: UIViewController {

//MARK: Properties
    
    var testCareers = [Career]()
    var isFromResults = false
    
    // This data needs to be passed down again. Or could it be accesed with CareerResultsController.displayState..?
    var displayState: DisplayState? {
        didSet {
            if displayState != nil {
                print("displayState passed down. displayState:", displayState!)
            }
        }
    }
    // This data needs to be passed down again. Or could it be accesed with CareerResultsController.results..?
    var results: TestResults? {
        didSet {
            if results != nil {
                print("displayState passed down. displayState:", results!)
            }
        }
    }
    
//MARK: Outlets
    
    @IBOutlet weak var resultsRegisterButton: UIButton!
    @IBOutlet weak var resultsLoginButton: UIButton!

//MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyles()
        //performSegue(withIdentifier: "ShowResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowResults", let destination = segue.destination as? CareerListViewController {
            destination.displayState = .Results
            destination.results = TestResults(user: User("asd", "sfsdfasdasd", ""), personalityType: PersonalityType.INFP)

        }
    }
    
//MARK: Private functions
    
    private func setupStyles() {
        resultsLoginButton.backgroundColor = UIColor.sortingButtons(theme: .t9)
        resultsRegisterButton.backgroundColor = UIColor.sortingButtons(theme: .t9)
        resultsLoginButton.setTitleColor(UIColor.white, for: .normal)
        resultsRegisterButton.setTitleColor(UIColor.white, for: .normal)
        
    }
}
