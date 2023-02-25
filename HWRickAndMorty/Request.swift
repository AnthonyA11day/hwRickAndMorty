//
//  Request.swift
//  HWRickAndMorty
//
//  Created by Anthony on 25.02.2023.
//

import Foundation
import UIKit

extension ViewController {
    
    func obtainImage(compliation: @escaping ( (UIImage?) -> Void) ) {
        
        URLSession.shared.dataTask(with: URL(string: "https://dummyimage.com/300x300/ede8e9/f00014&text=RandM")!) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            else {
                let image  = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    compliation(image)
                }
            }
        }.resume()
    }
}
