//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by MXC Swift  on 9/28/20.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    
    
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
        }
///
        func calculatePersonalityResult() {
            var frequencyOfAnswers: [AnimalType: Int] = [:]
            let responseTypes = responses.map { $0.type }
            
            for response in responseTypes {
               let newCount: Int
                
                
                if let oldCount = frequencyOfAnswers[response] {
                    newCount = oldCount + 1
                } else {
                    newCount = 1
                }
                
                frequencyOfAnswers[response] = newCount
            }
            
//        let frequentAnswersSorted = frequencyOfAnswers.sorted(by:
//        {(pair1, pair2) -> Bool in
//            return pair1.value > pair2.value
//        } )
    
        //let mostCommonAnswer = frequentAnswersSorted.first!.key
            
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1}.first!.key
       
            resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
            resultDefinitionLabel.text = mostCommonAnswer.definition
        
        }
    

    
}///End Of Code
