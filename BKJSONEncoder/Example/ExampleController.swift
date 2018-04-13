//
//  ExampleController.swift
//  BKJSONEncoder
//
//  Created by Calebe Emerik  | Stone on 12/04/18.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

final class ExampleController: UIViewController {
    
    struct Pet: Codable {
        
        let name: String
        let age: Int
        let type: String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Using BKJSONEncoder
        
        
        let encoder = BKJSONEncoder()
        let myCat = Pet(name: "Bill", age: 2, type: "Cat")
        
        do {
            let pet = try encoder.encode(myCat)
            print(pet)
        }
        catch let error {
            print(error)
        }
        
        
        
        // NOT Using BKJSONEncoder
        
        
        let defaultEncoder = JSONEncoder()
        let myDog = Pet(name: "Bira", age: 33, type: "Dog")
        
        do {
            let encodedPet = try defaultEncoder.encode(myDog)
            let jsonObject = try JSONSerialization.jsonObject(with: encodedPet, options: [])
            let jsonPet = jsonObject as! JSON
            print(jsonPet)
        }
        catch let error {
            print(error)
        }
    }
}
