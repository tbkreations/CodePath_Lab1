//
//  ViewController.swift
//  CP_Lab1
//
//  Created by Trae Brown on 2/15/20.
//  Copyright © 2020 Trae Brown. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var card: UIView!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var a1Label: UILabel!
    @IBOutlet weak var a2Label: UILabel!
    @IBOutlet weak var a3Label: UILabel!
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
    }
    @IBAction func didTapOnCard(_ sender: Any) {
          if (questionLabel.isHidden == false) {
              questionLabel.isHidden = true;
          } else {
              questionLabel.isHidden =  false;
          }
    }
    
    func updateFlashcard(question: String, answer: String, optionTwo: String, optionThree: String) {
        questionLabel.text = question
        answerLabel.text = answer
        a1Label.text = optionTwo
        a2Label.text = optionThree
        a3Label.text = answer
    }
    
    @IBAction func didTapOnA1(_ sender: Any) {
        a1Label.isHidden = true;
    }
    @IBAction func didTapOnA2(_ sender: Any) {
        a2Label.isHidden = true;
    }
    @IBAction func didTapOnA3(_ sender: Any) {
        a3Label.layer.backgroundColor = UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: 1).cgColor;
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
