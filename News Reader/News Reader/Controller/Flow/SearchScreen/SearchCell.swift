//
//  SearchCell.swift
//  News Reader
//
//  Created by MAC on 17.12.2020.
//

import UIKit

final class SearchCell: UITableViewCell {

// MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var viewForSearchResult: UIView!
    
// MARK: - Lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        viewForSearchResult.layer.cornerRadius = 10
        viewForSearchResult.clipsToBounds = true
    }

// MARK: - Public Methods
    
    func configCell(by model: Article) {
        titleLabel.text = model.title.withoutHtml
        descriptionLabel.text = model.description.withoutHtml
    }
}

extension String {
    
    public var withoutHtml: String {
        guard let data = self.data(using: .utf8) else {
            return self
        }

        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]

        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return self
        }

        return attributedString.string
    }
}
