//
//  NewsItemCell.swift
//  StretchyHeaders
//
//  Created by shibin on 16/1/9.
//  Copyright © 2016年 啾三万. All rights reserved.
//

import UIKit

class NewsItemCell: UITableViewCell {
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    var newsItem: NewsItem? {
        didSet {
            if let item = newsItem {
                categoryLabel.text = item.category.toString()
                categoryLabel.textColor = item.category.toColor()
                summaryLabel.text = item.summary
            } else {
                categoryLabel.text = nil
                summaryLabel.text = nil
            }
        }
    }
    
}
