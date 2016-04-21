//
//  ViewController.swift
//  SwiftSessions
//
//  Created by Louiz on 17/03/2016.
//  Copyright © 2016 IdeaRobin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tweetView: UIView!
    @IBOutlet weak var tweetText: UITextField!
    @IBAction func tweetAction(sender: AnyObject) {
        if tweetText.text != "" {
           tweetDelegate?.addTweet(tweetText.text!)
        }
    }
    
    @IBOutlet weak var tweetContainer: UIView!
    var tweetDelegate: TweetContentDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetView.layer.shadowColor = UIColor.grayColor().CGColor
        tweetView.layer.shadowOpacity = 0.9
        tweetView.layer.shadowOffset = CGSizeZero
        tweetView.layer.shadowRadius = 10
        

    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? TweetTableViewController
            where segue.identifier == "TweetTable" {
                
                tweetDelegate = vc
        }
    }


}

