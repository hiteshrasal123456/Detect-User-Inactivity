//
//  main.swift
//  DetectUserTapActivity
//
//  Created by Tejora on 02/05/19.
//  Copyright © 2019 Tejora. All rights reserved.
//

import UIKit

CommandLine.unsafeArgv.withMemoryRebound(to: UnsafeMutablePointer<Int8>.self, capacity: Int(CommandLine.argc)) {argv in
    
    _ = UIApplicationMain(CommandLine.argc, argv, NSStringFromClass(MyApplication.self), NSStringFromClass(AppDelegate.self))
    
}
