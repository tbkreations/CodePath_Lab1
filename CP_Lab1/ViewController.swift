//
//  ViewController.swift
//  CP_Lab1
//
//  Created by Trae Brown on 2/15/20.
//  Copyright © 2020 Trae Brown. All rights reserved.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
    var optionalOne: String
    var optionalTwo: String
}

class ViewController: UIViewController {

    @IBOutlet weak var card: UIView!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var a1Label: UILabel!
    @IBOutlet weak var a2Label: UILabel!
    @IBOutlet weak var a3Label: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    var flashcards = [Flashcard]()
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.lineBreakMode = NSLineBreakMode.byWordWrapping;
        card.layer.cornerRadius = 20.0;
        card.clipsToBounds = true;
        a1Label.layer.cornerRadius = 20.0;
        a1Label.clipsToBounds = true;
        a2Label.layer.cornerRadius = 20.0;
        a2Label.clipsToBounds = true;
        a3Label.layer.cornerRadius = 20.0;
        a3Label.clipsToBounds = true;
        readSavedCards()
        if flashcards.count == 0 {
              updateFlashcard(question: "What Year Was Morehouse College Founded?", answer: "1867", optionTwo: "1878", optionThree: "1859")
        } else {
            updateLabels()
            updateNextPrevButtons()
        }
      
    }
    @IBAction func didTapOnCard(_ sender: Any) {
          if (questionLabel.isHidden == false) {
              questionLabel.isHidden = true;
              a3Label.backgroundColor = UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: 1);
          } else {
              questionLabel.isHidden =  false;
          }
    }
    @IBAction func didTapNext(_ sender: Any) {
        currentIndex += 1
        updateLabels()
        updateNextPrevButtons()
    }
    
    @IBAction func didTapBack(_ sender: Any) {
        currentIndex -= 1
        updateLabels()
        updateNextPrevButtons()
    }
    func updateFlashcard(question: String, answer: String, optionTwo: String, optionThree: String) {
        let flashcard = Flashcard(question: question, answer: answer, optionalOne: optionTwo, optionalTwo: optionThree)
        flashcards.append(flashcard)
        currentIndex = flashcards.count - 1
        updateNextPrevButtons()
        updateLabels()
        saveAllCards()
    }
    
    func updateLabels() {
        let currentFlashcard = flashcards[currentIndex]
        questionLabel.text = currentFlashcard.question
        answerLabel.text = currentFlashcard.answer
        a1Label.text = currentFlashcard.optionalOne
        a2Label.text = currentFlashcard.optionalTwo
        a3Label.text = currentFlashcard.answer
    }
    
    func updateNextPrevButtons() {
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
        
        if currentIndex == 0 {
            prevButton.isEnabled = false
        } else {
            prevButton.isEnabled = true
        }
    }
    
    func readSavedCards() {
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]] {
            let savedCards = dictionaryArray.map { dictionary -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!, optionalOne: dictionary["optionalOne"]!, optionalTwo: dictionary["optionalTwo"]!)
            }
            flashcards.append(contentsOf: savedCards)
        }
    }
    
    func saveAllCards() {
        let dictionaryArray = flashcards.map { (Card) -> [String: String] in
            return ["question": Card.question, "answer": Card.answer, "optionalOne": Card.optionalOne, "optionalTwo": Card.optionalTwo]
        }
        
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
    }
    
    @IBAction func didTapOnA1(_ sender: Any) {
        a1Label.isHidden = true;
    }
    @IBAction func didTapOnA2(_ sender: Any) {
        a2Label.isHidden = true;
    }
    @IBAction func didTapOnA3(_ sender: Any) {
        a3Label.backgroundColor = UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: 1);
        questionLabel.isHidden = true;
    }
    @IBAction func didTapOnReset(_ sender: Any) {
        a1Label.isHidden = false;
        a2Label.isHidden = false;
        a3Label.isHidden = false;
        questionLabel.isHidden = false;
        a3Label.backgroundColor = UIColor(red: 148.0/255, green: 17.0/255, blue: 0/255, alpha: 1);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as! CreationViewController
        
        creationController.flashcardsController = self
    }
}
