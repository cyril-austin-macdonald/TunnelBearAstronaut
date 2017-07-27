//
//  RotatingAstronautView.swift
//  TunnelBearAstronaut
//
//  Created by Cyril MacDonald on 2017-07-27.
//  Copyright © 2017 Cyril MacDonald. All rights reserved.
//

import UIKit;

// MARK: - RotatingAstronautView

class RotatingAstronautView: UIView
{
    @IBOutlet var earthView: UIView?;
    @IBOutlet var astronautView: UIView?;
    
    // MARK: - Initialization
    
    override func awakeFromNib()
    {
        super.awakeFromNib();
        
        self.setupRotatingAnimation();
        
        self.stopAnimating();
    }
    
    // MARK: - Public methods
    
    public func startAnimating()
    {
        if (self.astronautView != nil)
        {
            let layer = self.astronautView!.layer;
            
            if (layer.speed == 0)
            {
                // Resume
                
                let timeOffset = layer.timeOffset;
                
                layer.speed = 1.0;
                layer.timeOffset = 0.0;
                layer.beginTime = 0.0;
                
                layer.beginTime = layer.convertTime(CACurrentMediaTime(), from: nil) - timeOffset;
            }
        }
    }
    
    public func stopAnimating()
    {
        if (self.astronautView != nil)
        {
            let layer = self.astronautView!.layer;
            
            if (layer.speed != 0)
            {
                // Pause
                
                let timeOffset = layer.convertTime(CACurrentMediaTime(), from: nil);
            
                layer.speed = 0.0;
                layer.timeOffset = timeOffset;
            }
        }
    }
    
    // MARK: - Private methods
    
    private func setupRotatingAnimation()
    {
        if (self.earthView != nil && self.astronautView != nil)
        {
            let dy = self.astronautView!.center.y - self.earthView!.center.y;
            let dx = self.astronautView!.center.x - self.earthView!.center.x;
            
            let radius = sqrt(dy * dy + dx * dx);
            
            let circlePath = UIBezierPath(
                arcCenter: self.earthView!.center,
                radius: CGFloat(radius),
                startAngle: 0,
                endAngle: CGFloat(2 * Double.pi),
                clockwise: true
            );

            let animation = CAKeyframeAnimation(keyPath: "position");
            
            animation.duration = 2.0;
            animation.repeatCount = MAXFLOAT;
            animation.path = circlePath.cgPath;
            animation.rotationMode = kCAAnimationRotateAuto;
            animation.isRemovedOnCompletion = false;
            
            self.astronautView!.layer.add(animation, forKey: animation.keyPath);
        }
    }
}
