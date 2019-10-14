//
//  HyperlinkTextField.swift
//  Freelancer
//
//  Modified by Nikola on 2/4/19.
//  Copyright © 2017 StackOverflow user "jeremyforan" (https://stackoverflow.com/users/749730/jeremyforan). All rights reserved.
//  Original source:
//  https://stackoverflow.com/a/46897824/414187
//
//  Hyperlink text field (clickable & handled by default browser)

import Cocoa

@IBDesignable
class HyperlinkTextField: NSTextField {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
    @IBInspectable var href: String = ""
    
    override func resetCursorRects() {
        discardCursorRects()
        addCursorRect(self.bounds, cursor: NSCursor.pointingHand)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: NSColor.linkColor,
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue as AnyObject
        ]
        attributedStringValue = NSAttributedString(string: self.stringValue, attributes: attributes)
    }
    
    override func mouseDown(with theEvent: NSEvent) {
        if let localHref = URL(string: href) {
            NSWorkspace.shared.open(localHref)
        }
    }
}
