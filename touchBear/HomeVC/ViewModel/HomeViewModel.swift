//
//  HomeViewModel.swift
//  touchBear
//
//  Created by Ismael Reckziegel on 18/09/24.
//

import UIKit

class HomeViewModel {
    
    private var dataCharacters: [Characters] = [
        
        Characters(image: "bird"),
        Characters(image: "cat"),
        Characters(image: "chicken"),
        Characters(image: "dinosaur"),
        Characters(image: "dog"),
        Characters(image: "duck"),
        Characters(image: "goffy"),
        Characters(image: "mickey"),
        Characters(image: "minnie"),
        Characters(image: "pluto"),
        Characters(image: "daisy"),
        Characters(image: "donald"),
        
    ]
    
    public var getCharacters: [Characters] { return dataCharacters }
    
}
