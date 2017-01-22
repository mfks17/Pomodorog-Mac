//
//  AppDelegate.swift
//  Pomodorog
//
//  Created by mfks17 on 10/2/16.
//  Copyright © 2016 mfks17.org. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var statusItem: NSStatusItem?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application

        let statusBar: NSStatusBar = NSStatusBar.system()
        statusItem = statusBar.statusItem(withLength: NSVariableStatusItemLength)
        statusItem?.isEnabled = true
        statusItem?.target = self
        statusItem?.title = "00:00"
        statusItem?.menu = NSMenu()

        let startMenuItem : NSMenuItem = NSMenuItem.init(title: "Start", action: Selector(("Start:")), keyEquivalent: "S")
        startMenuItem.isEnabled = true
        startMenuItem.target = self
        startMenuItem.action = #selector(Start)

        let stopMenuItem: NSMenuItem = NSMenuItem.init(title: "Stop", action: Selector(("Stop:")), keyEquivalent: "T")
        stopMenuItem.target = self
        stopMenuItem.isEnabled = true
        stopMenuItem.action = #selector(Stop)
        
        let quitItem : NSMenuItem = NSMenuItem(title: "Quit", action: Selector(("Quit:")), keyEquivalent: "q")
        quitItem.isEnabled = true
        quitItem.target = self
        quitItem.action = #selector(Quit)

        statusItem?.menu?.addItem(startMenuItem)
        statusItem?.menu?.addItem(stopMenuItem)
        statusItem?.menu?.addItem(NSMenuItem.separator())
        statusItem?.menu?.addItem(quitItem)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func Quit(sender: AnyObject?) {
        NSLog("Exit")
        NSApplication.shared().terminate(nil)
    }

    func Start(sender: AnyObject?) {
        NSLog("start")
        statusItem?.title = "25:00"
    }

    func Stop(sender: AnyObject?) {
        NSLog("stop")
    }
}
