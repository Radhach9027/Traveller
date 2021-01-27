import SwiftTraveller
import UIKit

protocol TravellerProtocol {
    
    func storySwitch(story: Stories, destination: Destinations)

    func push(type: Destinations)
    func pop(type: Destinations?, root: Bool)

    func present(type: Destinations)
    func dismiss()
    
    
    func addChild(type: Destinations)
    func removeChild()

    func performSegue(story: Stories, type: Destinations)
    func unWind(story: Stories, type: Destinations)
}

//mark: Story Switching

extension TravellerProtocol {
    
    func storySwitch(story: Stories, destination: Destinations) {
        let story = UIStoryboard(name: story.rawValue, bundle: nil)
        Traveller.route.switchRootViewController(storyBoard: story, controllerDestination: .type(val: destination.rawValue), animated: true, window: UIWindow.window, modelTransistion: .transitionCrossDissolve).perform()
    }
}

//mark: Push&Pop

extension TravellerProtocol {
    
    func push(type: Destinations) {
        Traveller.route.push(controller: .type(val: type.rawValue), animated: true, hidesTopBar: false, hidesBottomBar: true, modelTransistion: .crossDissolve, modelPresentation: .automatic).perform()
    }
    
    func pop(type: Destinations?, root: Bool) {
        
        if  type != nil {
            Traveller.route.popToViewController(destination: LaunchViewController.self, animated: true, modelTransistionStyle: .crossDissolve).perform()
        } else {
            Traveller.route.pop(toRootController: root, animated: true, modelTransistionStyle: .crossDissolve).perform()
        }
    }
}

//mark: Present&Dismiss

extension TravellerProtocol {
   
    func present(type: Destinations) {
        Traveller.route.present(controller: .type(val: type.rawValue), animated: true, modelTransistion: .crossDissolve, modelPresentation: .automatic).perform()
    }
    
    func dismiss() {
        Traveller.route.dismiss(modelTransistionStyle: .crossDissolve, animated: false){ _ in}.perform()
    }
}

//mark: Add Child&Remove Child

extension TravellerProtocol {
    
    func addChild(type: Destinations) {
        Traveller.route.addChild(childController: .type(val: type.rawValue), modelTransistionStyle: .crossDissolve).perform()
    }
    
    func removeChild() {
        Traveller.route.removeChild.perform()
    }
}

//mark: Perform Segue&Unwind

extension TravellerProtocol {
    
    func performSegue(story: Stories, type: Destinations) {
        let story = UIStoryboard(name: story.rawValue, bundle: nil)
        Traveller.route.performSegue(segue: .type(val: type.rawValue), stroyPorotocol: story, modelTransistion: .crossDissolve).perform()
    }
    
    func unWind(story: Stories, type: Destinations) {
        let story = UIStoryboard(name: story.rawValue, bundle: nil)
        Traveller.route.unwind(destination: .type(val: type.rawValue), modelTransistionStyle: .crossDissolve, storyBoardSegue: story as! TravellerStoryBoardSegueProtocol).perform()
    }
}
