//
//  ResultViewController.swift
//  Career Path
//
//  Created by iosdev on 25/11/2019.
//  Copyright © 2019 Team Awesome. All rights reserved.
//

import UIKit

class ResultViewController: BaseViewController {
    
    //MARK: variables
    let colorTheme: Themes = .t9
    var responses: [Answer]!
    //MARK: labels
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var result_button: UIButton!
    @IBOutlet weak var personality_label: UILabel!
    
    
    //MARK: class Personality test instance
    var personalityTest1 = PersonalityTest()
    //MARK: functions
    override func viewDidLoad() {
        super.viewDidLoad()
        colorSetup(theme: .t9)
        navigationItem.hidesBackButton = true
        self.title = "Test Results"
        addSlideMenuButton()
        //"personal type" result and description based on "personal type" test
        let personality = personalityTest1.definePersonalityType(responses: responses).rawValue
        resultLabel.text = personalityTest1.definePersonalityType(responses: responses).rawValue
        descriptionText.text = personalityTest1.definePersonalityType(responses: responses).description

        UserDefaults.standard.set(personality, forKey: "lastResult")

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowResults", let destination = segue.destination as? CareerListViewController {
            destination.displayState = .Results
            if PersistenceService.checkUserLoggedIn() {
                guard let user = PersistenceService.getUserFromDefaults() else { fatalError("User not found from UserDefaults") }
                destination.results = TestResults(user: user, personalityType: personalityTest1.definePersonalityType(responses: responses))
            } else {
                destination.results = TestResults(personalityType: personalityTest1.definePersonalityType(responses: responses))
            }
            
            saveResultsIfLogged()
        }
        else if segue.identifier == "ResultsRegister", let destination = segue.destination as? RegisterViewController {
            destination.isFromResults = true
            destination.resultsPersonalityType = personalityTest1.definePersonalityType(responses: responses)
        }
    }
    
    private func saveResultsIfLogged() {
        if PersistenceService.checkUserLoggedIn() {
            PersistenceService.saveTestResults(type: personalityTest1.definePersonalityType(responses: responses))
        }
    }
    
    // better to change names of functions in UIColor extension
    fileprivate func colorSetup(theme: Themes) {
        view.backgroundColor = UIColor.viewBackground(theme: colorTheme)
        result_button.backgroundColor = UIColor.testButtonsBackground(theme: colorTheme)
        result_button.setTitleColor(UIColor.testButtonsTitle(theme: colorTheme), for: .normal)
        resultLabel.textColor = UIColor(hex:"#0066CBff")
        descriptionText.textColor = UIColor.testHeaderAndQuestion(theme: colorTheme)
        personality_label.textColor = UIColor.testHeaderAndQuestion(theme: colorTheme)
    }
    
   
}
