//
//  AppDelegate.swift
//  trolldrop-macos
//
//  Created by Duncan Leo on 22/11/19.
//  Copyright © 2019 Duncan Leo. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!
    var guts: FIAirDropViewGutsController?
    
    var listViewController: NSViewController? {
        return guts?.value(forKey: "listViewController") as? NSViewController
    }
    
    var dataSource: NSArrayController? {
        return listViewController?.value(forKey: "dataSource") as? NSArrayController
    }
    
    var listItems: NSArray? {
        return dataSource?.arrangedObjects as? NSArray
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()

        // Create the window and set the content view. 
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
        
        self.guts = FIAirDropViewGutsController()
//        self.guts = (objc_getClass("FIAirDropViewGutsController") as! NSObject).perform(NSSelectorFromString("new"))?.takeRetainedValue() as! FIAirDropViewGutsController
        
        
        
        self.guts?.urlsToSend = [
            NSURL(fileURLWithPath: "/Users/duncanleo/Downloads/ss.png")
        ]
        
        self.guts?.configureForAirDropAvailability()
        self.guts?.resumeAirDropDiscovery()
        self.guts?.viewDidMoveToWindow()
        
        print (self.listItems?.count)
        
        let timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
//            print(self.listViewController)
            print(self.listItems?.count)
            
        }
//        print(listItems)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
        
    }


}

