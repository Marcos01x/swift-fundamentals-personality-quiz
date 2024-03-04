//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by marcos.arroyo on 12/02/24.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    var responses: [Answer]
    
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true

    }

    func calculatePersonalityResult() {
        let frequencyOfAnswer = responses.reduce(into: [AnimalType:Int]()) { counts, anwer in
            if let existingCount = counts[anwer.type] {
                counts[anwer.type] = existingCount + 1
            } else {
                counts[anwer.type] = 1
            }
        }
        
        let frequentAnswerSorted = frequencyOfAnswer.sorted { $0.value > $1.value }
        let mostCommonAnswer = frequentAnswerSorted.first!.key

        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }

}
