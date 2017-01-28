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
    
    //ユーザーが指定した時間(仮) 分
    let userTimer:Int = 1
    var count = 0
    
    var minString: String = ""
    var secondSting: String = ""

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
        self.timer()
    }

    func Stop(sender: AnyObject?) {
        NSLog("stop")
    }
    
    func timer() -> Void {
        self.count = self.userTimer * 500
        _ = Timer.scheduledTimer(
            timeInterval: 1.0,
            target:self,
            selector: #selector(AppDelegate.timerAction),
            userInfo:nil,
            repeats:true)
            .fire()
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
