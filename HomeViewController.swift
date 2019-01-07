//
//  HomeViewController.swift
//  CNPGuide
//
//  Created by Austin Rath on 4/25/18.
//  Copyright © 2018 Austin Rath. All rights reserved.
//
//  Updated by Mike Yakubovsky on 9/29/18.
//

import UIKit
import SafariServices

class HomeViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var launchCNPWebsiteButton: UIButton!
    @IBOutlet weak var topButtonBackground: UIView!
    @IBOutlet weak var birdGuideButtonBackground: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        birdGuideButtonBackground.layer.cornerRadius = 20
        topButtonBackground.layer.cornerRadius = 20
    }

    @IBAction func launchCNPWebsiteButtonPressed(_ sender: Any) {
        if let url = URL(string: "https://www.coppellnaturepark.org") {
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController,
                    animated: true,
                    completion: nil)
        }
    }
    
    @IBAction func unwindToHome(unwindSegue: UIStoryboardSegue) {
        
    }

}

