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
        /*
         NSStatusBar *statusBar = [NSStatusBar systemStatusBar];

         self.statusItem = [statusBar statusItemWithLength:60.f];
         self.statusItem.title = @"00:00";
         self.statusItem.target = self;
         self.statusItem.action = @selector(showMenu);
         [self.statusItem setEnabled:YES];


        NSMenuItem *startMenuItem = [[NSMenuItem alloc] init];
        startMenuItem.title = @"Start";
        startMenuItem.target = timer;
        startMenuItem.action = @selector(start);

        NSMenuItem *stopMenuItem = [[NSMenuItem alloc] init];
        stopMenuItem.title = @"Stop";
        stopMenuItem.target = timer;
        stopMenuItem.action = @selector(stop);

        NSMenuItem *quitMenuItem = [[NSMenuItem alloc] init];
        quitMenuItem.title = @"Quit";
        quitMenuItem.target = [NSApplication sharedApplication];
        quitMenuItem.action = @selector(terminate:);

        NSMenu *menu = [[NSMenu alloc] initWithTitle:@"weeeeei"];
        [menu addItem:startMenuItem];
        [menu addItem:stopMenuItem];
        [menu addItem:quitMenuItem];
        
        [self.statusItem popUpStatusItemMenu:menu];
 */

        let statusBar: NSStatusBar = NSStatusBar.system()
        statusItem = statusBar.statusItem(withLength: NSVariableStatusItemLength)
        statusItem?.isEnabled = true
        statusItem?.target = self
        statusItem?.title = "00:00"
        statusItem?.menu = NSMenu()


        let startMenuItem : NSMenuItem = NSMenuItem.init(title: "Start", action: Selector(("Quit:")), keyEquivalent: "")
        startMenuItem.target = self
        startMenuItem.isEnabled = true

        
        let stopMenuItem: NSMenuItem = NSMenuItem.init()
        stopMenuItem.title = "Stop"
        stopMenuItem.target = self
        stopMenuItem.isEnabled = true
        
        let quitItem : NSMenuItem = NSMenuItem(title: "Quit", action: Selector(("Quit:")), keyEquivalent: "")
        quitItem.isEnabled = true
        quitItem.target = self
        quitItem.action = #selector(Quit)


        statusItem?.menu?.addItem(startMenuItem)
        statusItem?.menu?.addItem(stopMenuItem)
        statusItem?.menu?.addItem(NSMenuItem.separator())
        statusItem?.menu?.addItem(quitItem)
//        statusItem?.popUpMenu((statusItem?.menu)!)

    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func Quit(sender: AnyObject?) {
        NSLog("Exit")
        NSApplication.shared().terminate(nil)
    }


}

