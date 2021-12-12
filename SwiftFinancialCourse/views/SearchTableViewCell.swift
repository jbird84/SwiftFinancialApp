//
//  SearchTableViewCell.swift
//  SwiftFinancialCourse
//
//  Created by Kinney Kare on 12/10/21.
//

import Foundation
import UIKit


class SearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var assetNameLabel: UILabel!
    @IBOutlet weak var assetSymbolLabel: UILabel!
    @IBOutlet weak var assetTypeLabel: UILabel!
    
    
    func configure(with searchResult: SearchResult) {
        assetNameLabel.text = searchResult.name
        assetTypeLabel.text = searchResult.type.appending(" ").appending(searchResult.currency)
        assetSymbolLabel.text = searchResult.symbol
    }
    
}
