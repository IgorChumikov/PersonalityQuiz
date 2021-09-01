//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var individualUserAnswers = [Answer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setHidesBackButton(true, animated: false)
        
        emojiLabel.text = calculatedAnswer.emoji
        descriptionLabel.text = calculatedAnswer.description
    }
    
    private var calculatedAnswer: (emoji: String?, description: String?) {
        
        let animals = individualUserAnswers.map { $0.animal }
        
        let emoji = Dictionary(grouping: animals) { $0 }.sorted { $0.value.count > $1.value.count}.first?.key
        
        let description = emoji?.definition
        
        return (String(emoji?.rawValue ?? "？") , description)
    }
}
