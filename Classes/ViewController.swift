//
//  ViewController.swift
//  TunnelBearAstronaut
//
//  Created by Cyril MacDonald on 2017-07-27.
//  Copyright © 2017 Cyril MacDonald. All rights reserved.
//

import UIKit;

// MARK: - ViewController

class ViewController: UIViewController
{
    @IBOutlet var rotatingAstronautView: RotatingAstronautView?;
    
    // MARK: - View methods
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
    }
    
    // MARK: - Actions
    
    @IBAction public func startAnimating()
    {
        self.rotatingAstronautView?.startAnimating();
    }
    
    @IBAction public func stopAnimating()
    {
        self.rotatingAstronautView?.stopAnimating();
    }
}

