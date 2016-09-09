//
//  OFKeyboardAccessoryView.swift
//  off
//
//  Created by Peter Denniss on 29/10/2014.
//  Copyright (c) 2014 Tattva, Inc. All rights reserved.
//

import UIKit

class PDKeyboardAccessoryView: UIInputView
{
    var responder: UIResponder
    @IBOutlet weak var titleLabel: UILabel!
    
    init(frame: CGRect, responder: UIResponder)
    {
        self.responder = responder
        super.init(frame: frame, inputViewStyle: UIInputViewStyle.Keyboard)
        let view = NSBundle.mainBundle().loadNibNamed("PDKeyboardAccessoryView", owner: self, options: nil)!.first as! UIView
        self.addSubview(view)
        
        self.addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0))
        
        if systemIsPreIOS8()
        {
            self.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        }
        else
        {
            self.translatesAutoresizingMaskIntoConstraints = false
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    required init(coder aDecoder: NSCoder)
    {
        self.responder = UIResponder()
        super.init(coder: aDecoder)!
    }

    @IBAction func donePressed(sender: AnyObject)
    {
        responder.resignFirstResponder()
    }
    
}
