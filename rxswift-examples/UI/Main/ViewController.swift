//
//  ViewController.swift
//  rxswift-examples
//
//  Copyright © 2015年 53ningen. All rights reserved.
//

import RxSwift
import UIKit

class ViewController: UIViewController {

    private var disposeBag: DisposeBag = DisposeBag()
    
    @IBOutlet weak var buttonSampleButton: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        buttonSampleButton.rx_tap
            .subscribeNext {
                let vc: ButtonSampleViewController = Storyboard.getViewController(.ButtonSample)
                self.navigationController?.pushViewController(vc, animated: true)
            }
            .addDisposableTo(disposeBag)
    }
        
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        disposeBag = DisposeBag()
    }

}

