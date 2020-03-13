//
//  CreationViewController.swift
//  CP_Lab1
//
//  Created by Trae Brown on 2/29/20.
//  Copyright © 2020 Trae Brown. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    
    var flashcardsController: ViewController!
    @IBOutlet weak var questionField: UITextField!
    @IBOutlet weak var answerField: UITextField!
    @IBOutlet weak var choiceTwo: UITextField!
    @IBOutlet weak var choiceThree: UITextField!
    

    @IBAction func cancelTap(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func doneTap(_ sender: Any) {
        let qText = questionField.text
        let aText = answerField.text
        let optionTwo = choiceTwo.text
        let optionThree = choiceThree.text
        
        flashcardsController.updateFlashcard(question: qText!, answer: aText!, optionTwo: optionTwo!, optionThree: optionThree!)
        
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
