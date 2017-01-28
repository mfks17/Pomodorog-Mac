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

    var timer: Timer!
    
    var startMenuItem: NSMenuItem!
    var stopMenuItem: NSMenuItem!
    var quitItem: NSMenuItem!

    //ユーザーが指定した時間(仮) 分
    let userTimer:Int = 1
    var count = 0
    
    var minString: String = ""
    var secondSting: String = ""

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application

        self.count = self.userTimer * 500

        let statusBar: NSStatusBar = NSStatusBar.system()
        statusItem = statusBar.statusItem(withLength: NSVariableStatusItemLength)
        statusItem?.target = self
        statusItem?.title = "00:00"
        statusItem?.menu = NSMenu()
        statusItem?.menu?.autoenablesItems = false

        self.startMenuItem = NSMenuItem.init(title: "Start", action: Selector(("Start:")), keyEquivalent: "S")
        startMenuItem.isEnabled = true
        startMenuItem.target = self
        startMenuItem.action = #selector(Start)

        stopMenuItem = NSMenuItem.init(title: "Stop", action: Selector(("Stop:")), keyEquivalent: "T")
        stopMenuItem.isEnabled = false
        stopMenuItem.target = self
        stopMenuItem.action = #selector(Stop)
        
        quitItem = NSMenuItem(title: "Quit", action: Selector(("Quit:")), keyEquivalent: "q")
        quitItem.isEnabled = true
        quitItem.target = self
        quitItem.action = #selector(Quit)

        statusItem?.menu?.addItem(startMenuItem)
        statusItem?.menu?.addItem(self.stopMenuItem)
        statusItem?.menu?.addItem(NSMenuItem.separator())
        statusItem?.menu?.addItem(quitItem)
        statusItem?.menu?.item(at: 1)?.isEnabled = false
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
        self.countDonw()
        self.startMenuItem.isEnabled = false
        if self.startMenuItem.title == "Restart" {
            self.startMenuItem.title = "Start"
        }
        self.stopMenuItem.isEnabled = true
    }

    func Stop(sender: AnyObject?) {
        NSLog("stop")
        if timer.isValid {
            timer.invalidate()
            self.startMenuItem.isEnabled = true
            self.startMenuItem.title = "Restart"
            self.stopMenuItem.isEnabled = false
        } else {
            self.countDonw()
        }
        
    }
    
    func countDonw() -> Void {

        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target:self,
            selector: #selector(AppDelegate.timerAction),
            userInfo:nil,
            repeats:true)
        timer.fire()
    }
    
    func timerAction(sender: Timer) -> Void {
        
        self.minString = calcMin(secCount: count)
        self.secondSting = calcSec(secCount: count)
        
        statusItem?.title = minString + ":" + secondSting
        self.count -= 1
    }
    
    fileprivate func calcMin (secCount: Int) -> String {
        let min = count / 60
        if min < 10 {
            return "0" + String(min)
        }
        return String(min)
    }
    
    fileprivate func calcSec (secCount: Int) -> String {
        let sec = count % 60
        if sec < 10 {
            return "0" + String(sec)
        }
        return String(sec)
    }
}
