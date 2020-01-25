//
//  Data.swift
//  vocabRecitation
//
//  Created by CIeas.Chen on 10/23/19.
//  Copyright © 2019 CIeas Chen. All rights reserved.
//

import Foundation

class VocabData {
    
    var vocabArray = [DataBase]();
    
    var counter : Int = 0;
    
    init() {
        
        vocabArray.append(DataBase(vocabularyInput: "Welcome Home", meaningInput: "Designed by Cieas"));
        
        
    }
    
    func newAppend(vocab : String, meaning: String) {
        if ( counter == 0 ){
            vocabArray.removeAll();
            counter += 1;
        }
        vocabArray.append(DataBase(vocabularyInput: vocab, meaningInput: meaning));
    }
    
}
