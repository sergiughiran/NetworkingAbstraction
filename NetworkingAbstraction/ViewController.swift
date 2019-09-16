//
//  ViewController.swift
//  NetworkingAbstraction
//
//  Created by Ghiran Sergiu-Robert on 22/07/2019.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let commentsService = CommentsService()
        commentsService.fetchComments { (result) in
            switch result {
            case .success(let comments):
                print(comments)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }


}

