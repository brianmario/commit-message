//
//  ViewController.swift
//  commit-message
//
//  Created by Brian Lopez on 10/29/18.
//  Copyright © 2018 Brian Lopez. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
  @IBOutlet weak var subjectField: NSTextField!
  @IBOutlet weak var bodyField: NSTextField!

  override func viewDidLoad() {
    super.viewDidLoad()

    if (CommandLine.arguments.count > 1) {
      // We'll just assume CommandLine.arguments[1] is the commit message file we need to edit.

      var commitMessageTemplate: [String] = [""]

      do {
        commitMessageTemplate = try String(contentsOfFile: CommandLine.arguments[1]).components(separatedBy: NSCharacterSet.newlines)
      } catch {
        print("Error loading file: \(error).")
      }

      subjectField.stringValue = commitMessageTemplate[0]

      bodyField.stringValue = commitMessageTemplate[1...].joined(separator: "\n").trimmingCharacters(in: NSCharacterSet.newlines)
    }
  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }


}

