//
//  tweetBoxViewController.swift
//  SwiftSessions
//
//  Created by Louiz on 05/04/2016.
//  Copyright © 2016 IdeaRobin. All rights reserved.
//

import UIKit

class TweetBoxViewController: UIViewController {
    @IBOutlet weak var tweetContent: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.layer.shadowColor = UIColor.grayColor().CGColor
        self.view.layer.shadowOpacity = 0.9
        self.view.layer.shadowOffset = CGSizeZero
        self.view.layer.shadowRadius = 4
        self.view.layer.borderColor = UIColor.grayColor().CGColor
        
        //
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

