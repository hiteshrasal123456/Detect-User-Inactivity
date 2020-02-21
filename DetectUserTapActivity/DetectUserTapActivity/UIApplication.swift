//
//  UIApplication.swift
//  DetectUserTapActivity
//
//  Created by Tejora on 02/05/19.
//  Copyright © 2019 Tejora. All rights reserved.
//


import UIKit

@objc(MyApplication)

class MyApplication: UIApplication {
    
    static let ApplicationDidTimoutNotification = "AppTimout"
    // The timeout in seconds for when to fire the idle timer.
    let timeoutInSeconds: TimeInterval = 60 * 5
    var idleTimer: Timer?
    // Listen for any touch. If the screen receives a touch, the timer is reset.
    override func sendEvent(_ event: UIEvent) {
        super.sendEvent(event)
        if idleTimer != nil {
            self.resetIdleTimer()
        }
        if let touches = event.allTouches {
            for touch in touches {
                if touch.phase == UITouch.Phase.began {
                    self.resetIdleTimer()
                }
            }
        }
    }
    
    // Resent the timer because there was user interaction.
    func resetIdleTimer() {
        if let idleTimer = idleTimer {
            idleTimer.invalidate()
        }
        idleTimer = Timer.scheduledTimer(timeInterval: timeoutInSeconds, target: self, selector: #selector(self.idleTimerExceeded), userInfo: nil, repeats: false)
    }
    
    // If the timer reaches the limit as defined in timeoutInSeconds, post this notification.
  @objc  func idleTimerExceeded() {
        NotificationCenter.default.post(name:Notification.Name.TimeOutUserInteraction, object: nil)
    }
}

extension NSNotification.Name {
    public static let TimeOutUserInteraction: NSNotification.Name = NSNotification.Name(rawValue: "MyApplication")
}
