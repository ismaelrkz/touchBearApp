//
//  cardCharacterCellViewModel.swift
//  touchBear
//
//  Created by Ismael Reckziegel on 13/09/24.
//

import UIKit

class CardCharacterCellViewModel {
    
    private var dataCharacters: [Characters]
    
    init(dataCharacters: [Characters]) {
        
        self.dataCharacters = dataCharacters
        
    }
    
    public func loadCurrentData(indexPath: IndexPath) -> Characters {
        
        return dataCharacters[indexPath.row]
        
    }
    
    public var numberOfItems: Int {
        
        return dataCharacters.count
        
    }
    
    
    public func sizeForItem(collectionViewWidth: CGFloat, columns: Int) -> CGSize { // estudar código
        
        let padding: CGFloat = 5
        let availableWidth = collectionViewWidth / CGFloat(columns) - padding
        
        return CGSize(width: availableWidth, height: availableWidth)
        
    }
    
}
