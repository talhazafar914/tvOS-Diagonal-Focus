//
//  ViewController.swift
//  FocusGuid
//
//  Created by Haris Jamil on 05/08/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    private var focusGuide = UIFocusGuide()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.addLayoutGuide(self.focusGuide)
        self.focusGuide.leftAnchor.constraint(equalTo: self.button1.leftAnchor).isActive = true
        self.focusGuide.topAnchor.constraint(equalTo: self.button2.topAnchor).isActive = true
        self.focusGuide.widthAnchor.constraint(equalTo: self.button1.widthAnchor).isActive = true
        self.focusGuide.heightAnchor.constraint(equalTo: self.button2.heightAnchor).isActive = true
    }

    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        guard let nextFocusedView = context.nextFocusedView else {
            return
        }
    // When the focus engine focuses on the focus guide, we can programmatically tell it which element should be focused next.
        switch nextFocusedView {
            case self.button2:
                self.focusGuide.preferredFocusedView = self.button1
            case self.button1:
                self.focusGuide.preferredFocusedView = self.button2
            default:
                self.focusGuide.preferredFocusedView = nil
        }
    }

}

