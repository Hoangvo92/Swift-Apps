//
//  DetailViewController.swift
//  blogReader
//
//  Created by Hoang Vo on 6/16/20.
//  Copyright © 2020 Hoang Vo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    

    @IBOutlet weak var webContent: UIWebView!
    

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            
            self.title = detail.value(forKey: "title") as! String
            if let blogWeb = self.webContent {
                //label.text = detail.timestamp!.description
              //  label.text = detail.value(forKey: "title") as? String
                blogWeb.loadHTMLString(detail.value(forKey: "content") as! String, baseURL: nil)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }

    var detailItem: Event? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

//AIzaSyACgQ2DfKFU5922pj0FvQuEYabCtVVC71Q

//AIzaSyA64KcTIQckglyfwDDun8c0LBVxVruQLec

//https://www.googleapis.com/blogger/v3/blogs/2399953?key=AIzaSyA64KcTIQckglyfwDDun8c0LBVxVruQLec

//https://www.googleapis.com/blogger/v3/blogs/byurl?url=https://googleblog.blogspot.co.uk/&key=AIzaSyA64KcTIQckglyfwDDun8c0LBVxVruQLec



//new id
//https://www.googleapis.com/blogger/v3/blogs/10861780?key=AIzaSyA64KcTIQckglyfwDDun8c0LBVxVruQLec


//final url:   https://www.googleapis.com/blogger/v3/blogs/10861780/posts?key=AIzaSyA64KcTIQckglyfwDDun8c0LBVxVruQLec
