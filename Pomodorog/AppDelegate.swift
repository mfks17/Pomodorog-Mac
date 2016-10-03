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
        let statusItem: NSStatusItem = statusBar.statusItem(withLength: 60.0)
        statusItem.title = "00:00"
        statusItem.target = self
        statusItem.isEnabled = true



        let startMenuItem : NSMenuItem = NSMenuItem.init()
        startMenuItem.title = "Start"

        let menu: NSMenu = NSMenu.init()
        menu.title = "Start"
        menu.addItem(startMenuItem)

        statusItem.popUpMenu(menu)


    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

