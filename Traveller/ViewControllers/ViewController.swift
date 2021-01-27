import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: TravellerProtocol {
    @IBAction func storySwitchButtonPressed(_ sender: UIButton) {
        storySwitch(story: .login, destination: .launch)
    }
}

