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
    
    init(frame: CGRect, responder: UIResponder)
    {
        self.responder = responder
        super.init(frame: frame, inputViewStyle: UIInputViewStyle.Keyboard)
        self.setTranslatesAutoresizingMaskIntoConstraints(false)
        var view = NSBundle.mainBundle().loadNibNamed("PDKeyboardAccessoryView", owner: self, options: nil).first as UIView!
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.addSubview(view)
        PDUtilities.addConstraintsForSubview(view, toFillSuperView: self)
    }

    required init(coder aDecoder: NSCoder)
    {
        self.responder = UIResponder()
        super.init(coder: aDecoder)
    }

    @IBAction func donePressed(sender: AnyObject)
    {
        responder.resignFirstResponder()
    }
    
}
