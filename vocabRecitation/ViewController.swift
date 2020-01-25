//
//  ViewController.swift
//  vocabRecitation
//
//  Created by CIeas.Chen on 10/23/19.
//  Copyright © 2019 CIeas Chen. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    let data = VocabData();
    
    var vocabss : String = "";
    var meaningss : String = "";
    
    var displayVocabInfo2 = [String]();
    var displayLabelInfo2 = [String]();
    
    let wordAppender = MyViewController();
    
    let square = UIView(frame: CGRect(x : 0, y : 170, width : 20, height : 50 ));
    
    var startingPoint : Int = 0;
    
    var secondViewControllerIdentifier : Int = 0;
    
    
    
    @IBOutlet weak var vocabulary: UILabel!
    @IBOutlet weak var meaning: UILabel!
    @IBOutlet weak var darkOrlight: UILabel!
    @IBOutlet weak var triangle: UIImageView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        square.backgroundColor = UIColor.orange;
        vocabulary.textColor = UIColor.white;
        meaning.textColor = UIColor.white;
        if (secondViewControllerIdentifier == 0){
            vocabulary.text = data.vocabArray[startingPoint].vocabulary;
            meaning.text = data.vocabArray[startingPoint].meaning;
        }
        else {
            vocabulary.text = displayVocabInfo2[0];
            meaning.text = displayLabelInfo2[0];
        }
        darkOrlight.textColor = UIColor.darkGray;
        self.view.backgroundColor = UIColor.black;
    }
    
    
    
    
    @IBAction func changer(_ sender: AnyObject) {
        
        if ( startingPoint < displayVocabInfo2.endIndex - 1)  {
            
            startingPoint += 1;
            vocab_label_change();
            
        }
        else {
            
            let alert = UIAlertController(title: "Congratulations!", message: "Now is time for another round of review.", preferredStyle: .alert);
            
            let startAgain = UIAlertAction(title: "Review", style: .default, handler:  {
                (UIAlertAction) in
                self.timeToStartAgain()
            })
            
            alert.addAction(startAgain);
            
            present(alert, animated: true, completion: nil);
            
        }
        
    }
    
    
    @IBAction func themeChange(_ sender: UISwitch) {
        if sender.isOn {
            vocabulary.textColor = UIColor.white;
            meaning.textColor = UIColor.white;
            square.backgroundColor = UIColor.green;
            darkOrlight.textColor = UIColor.darkGray;
            triangle.tintColor = UIColor.brown;
            self.view.backgroundColor = UIColor.black;
        }
        else{
            vocabulary.textColor = UIColor.black;
            meaning.textColor = UIColor.black;
            square.backgroundColor = UIColor.yellow;
            darkOrlight.textColor = UIColor.purple;
            triangle.tintColor = UIColor.white;
            self.view.backgroundColor = UIColor.orange;
        }
    }
    
    func vocab_label_change() {
            vocabulary.text = displayVocabInfo2[startingPoint]
            meaning.text = displayLabelInfo2[startingPoint]
    
    }
    
    func timeToStartAgain() {
        
        if (secondViewControllerIdentifier != 0)
        {
            vocabulary.text = displayVocabInfo2[0];
            meaning.text = displayLabelInfo2[0];
        }
        else
        {
            startingPoint = 0;
            vocabulary.text = data.vocabArray[startingPoint].vocabulary;
            meaning.text = data.vocabArray[startingPoint].meaning;
        }
        
    }
    

}

