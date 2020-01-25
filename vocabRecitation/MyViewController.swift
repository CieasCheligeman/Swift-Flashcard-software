//
//  MyViewController.swift
//  vocabRecitation
//
//  Created by CIeas.Chen on 1/21/20.
//  Copyright © 2020 CIeas Chen. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    var displayVocabInfo = [String]();
    var displayLabelInfo = [String]();
    
    let START : Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    let dealer = VocabData();
  
    @IBOutlet weak var vocabInput: UITextField!
    
    @IBOutlet weak var meaningInput: UITextField!
    
    
    @IBAction func appendData(_ sender: UIButton) {
        if (vocabInput.text!.isEmpty == false && meaningInput.text!.isEmpty == false){
            displayVocabInfo.append(vocabInput.text!)
            displayLabelInfo.append(meaningInput.text!)
            vocabInput.text = nil;
            meaningInput.text = nil;
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue2" {
            
            let firstVC = segue.destination as! ViewController;
            if (displayVocabInfo.endIndex != 0 && displayLabelInfo.endIndex != 0)
            { //in case the fatal flaw happen.
                for x in START...(displayVocabInfo.endIndex - 1) {
                    firstVC.displayLabelInfo2.append(displayLabelInfo[x]);
                    firstVC.displayVocabInfo2.append(displayVocabInfo[x]);
                }
                firstVC.secondViewControllerIdentifier = 1;
            }
        }
        
    }
    @IBAction func performSegue(_ sender: UIButton) {
        
        performSegue(withIdentifier: "segue2", sender: self);
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
