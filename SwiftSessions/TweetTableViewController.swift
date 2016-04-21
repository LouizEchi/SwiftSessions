//
//  TableViewController.swift
//  SwiftSessions
//
//  Created by Louiz on 21/04/2016.
//  Copyright © 2016 IdeaRobin. All rights reserved.
//

import Foundation
import UIKit


class TweetTableViewController : UITableViewController,  TweetContentDelegate {
    var tweets : [String]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame:CGRectZero)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        tableView.allowsSelection = true
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 1
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tweet = tweets[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("TweetCell") as! TweetCell
        cell.tweetContent.text! = tweet
        
        return cell
        
        
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let cellHeight : CGFloat = 70
        
        
        return cellHeight
    }
    
    func addTweet(text: String) {
        tweets.append(text)
        tableView.reloadData()
    }

}