//
//  ViewController.swift
//  StretchyHeaders
//
//  Created by shibin on 16/1/9.
//  Copyright © 2016年 啾三万. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    private let kTableHeaderHeight: CGFloat = 300.0
    private let kTableHeaderCutAway: CGFloat = 80.0
    
    var headerView: UIView!
    var headerMaskLayer: CAShapeLayer!
    
    let items = [
        NewsItem(category: .World, summary: "Climate change protests, divestments meet fossil fuels realities"),
        NewsItem(category: .Europe, summary: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'"),
        NewsItem(category: .MiddleEast, summary: "Airstrikes boost Islamic State, FBI director warns more hostages possible"),
        NewsItem(category: .Africa, summary: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim"),
        NewsItem(category: .AsiaPacific, summary: "Despite UN ruling, Japan seeks backing for whale hunting"),
        NewsItem(category: .Americas, summary: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"),
        NewsItem(category: .World, summary: "South Africa in $40 billion deal for Russian nuclear reactors"),
        NewsItem(category: .Europe, summary: "'One million babies' created by EU student exchanges"),
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil;
        tableView.addSubview(headerView)
        
        
        let effectiveHeight = kTableHeaderHeight - kTableHeaderCutAway/2
        tableView.contentInset = UIEdgeInsetsMake(effectiveHeight, 0, 0, 0)
        //tableView.contentOffset = CGPointMake(0, -kTableHeaderHeight)
        headerMaskLayer = CAShapeLayer()
        headerMaskLayer.fillColor = UIColor.blackColor().CGColor
        headerView.layer.mask = headerMaskLayer
        
        updateHeaderView()
        
    }
    
    func updateHeaderView() {
        let effectiveHeight = kTableHeaderHeight - kTableHeaderCutAway/2
        var headerRect = CGRectMake(0, -effectiveHeight, tableView.bounds.width, kTableHeaderHeight)
        if tableView.contentOffset.y < -effectiveHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y + kTableHeaderCutAway/2
        }
        
        headerView.frame = headerRect
        
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 0, y: 0))
        path.addLineToPoint((CGPoint(x: headerRect.width, y: 0)))
        path.addLineToPoint((CGPoint(x: headerRect.width, y: headerRect.height)))
        path.addLineToPoint((CGPoint(x: 0, y: headerRect.height-kTableHeaderCutAway)))
        headerMaskLayer?.path = path.CGPath
        
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
        print(scrollView.contentOffset.y)
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! NewsItemCell
        cell.newsItem = items[indexPath.row]
        return cell
    }


}


