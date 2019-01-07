//
//  BirdTableViewController.swift
//  CNPGuide
//
//  Created by Austin Rath on 4/30/18.
//  Copyright © 2018 Austin Rath. All rights reserved.
//
//  Updated by Mike Yakubovsky on 9/30/18.
//

import UIKit
import os.log

class BirdTableViewController: UITableViewController {
    
    // MARK: - Properties
    private let birdViewControllerSegueIdentifier = "toBirdViewController"
    private let birdCellIdentifier = "BirdCell"
    
    var birds = [Bird]()
    
    // MARK: - Actions
    @IBAction func unwindToBirdList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? BirdDetailViewController, let bird = sourceViewController.bird {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                birds[selectedIndexPath.row] = bird
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                let newIndexPath = IndexPath(row: birds.count, section: 0)
                
                birds.append(bird)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            saveBirds()
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "AddBird":
            os_log("Adding a new bird.", log: OSLog.default, type: .debug)
            
        case "ShowDetail":
            guard let birdDetailViewController = segue.destination as? BirdDetailViewController else {
                fatalError("Unexpected destingation: \(segue.destination)")
            }
            
            guard let selectedBirdCell = sender as? BirdTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedBirdCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedBird = birds[indexPath.row]
            birdDetailViewController.bird = selectedBird
            
        default:
            os_log("Go Home.", log: OSLog.default, type: .debug)
        }
    }
    
    
    
    // MARK: - Private Methods
    private func loadSampleBirds() {
        let BarnSwallowPhoto = UIImage(named: "BarnSwallow")
        let BarredOwlPhoto = UIImage(named: "BarredOwl")
        let Bewick_sWrenPhoto = UIImage(named: "Bewick_sWren")
        let BrownThrasherPhoto = UIImage(named: "BrownThrasher")
        let CarolinaChickadeePhoto = UIImage(named: "CarolinaChickadee")
        let CedarWaxingPhoto = UIImage(named: "CedarWaxing")
        let DarkEyedJuncoPhoto = UIImage(named: "DarkEyedJunco")
        let DownyWoodpeckerPhoto = UIImage(named: "DownyWoodpecker")
        let EaredGrebePhoto = UIImage(named: "EaredGrebe")
        let HouseFinchPhoto = UIImage(named: "HouseFinch")
        let HouseSparrowPhoto = UIImage(named: "HouseSparrow")
        let MallardPhoto = UIImage(named: "Mallard")
        let MourningDovePhoto = UIImage(named: "MourningDove")
        let NorthernBobwhitePhoto = UIImage(named: "NorthernBobwhite")
        let NorthernCardinalPhoto = UIImage(named: "NorthernCardinal")
        let NorthernMockingbirdPhoto = UIImage(named: "NorthernMockingbird")
        let PurpleMartinPhoto = UIImage(named: "PurpleMartin")
        let RedTailedHawkPhoto = UIImage(named: "RedTailedHawk")
        let RedWingedBlackbirdPhoto = UIImage(named: "RedWingedBlackbird")
        let RubyThroatedHummingbirdPhoto = UIImage(named: "RubyThroatedHummingbird")
        let ScissorTailedFlycatcherPhoto = UIImage(named: "ScissorTailedFlycatcher")
        let TuftedTitmousePhoto = UIImage(named: "TuftedTitmouse")

        guard let bird1 = Bird(birdName: "Barn Swallow", birdDescription: "Fun Fact: Main predators of barn swallows are cats, hawks, gulls and grackles", sighted: false, mainPhoto: BarnSwallowPhoto) else {
            fatalError("Unable to instantiate bird1")
        }
        guard let bird2 = Bird(birdName: "Barred Owl", birdDescription: "Fun Fact: The belly feathers of some Barred Owls are pink. This coloring may be the result of eating a lot of crayfish", sighted: false, mainPhoto: BarredOwlPhoto) else {
            fatalError("Unable to instantiate bird2")
        }
        guard let bird3 = Bird(birdName: "Bewick’s Wren", birdDescription: "Fun Fact: Hawks and owls are predators of adult house wrens. Cats, raccoons, squirrels, rats, possums and snakes eat eggs and young chicks", sighted: false, mainPhoto: Bewick_sWrenPhoto) else {
            fatalError("Unable to instantiate bird3")
        }
        guard let bird4 = Bird(birdName: "Brown Thrasher", birdDescription: "Fun Fact: An aggressive defender of its nest, the Brown Thrasher is known to strike people and dogs hard enough to draw blood", sighted: false, mainPhoto: BrownThrasherPhoto) else {
            fatalError("Unable to instantiate bird4")
        }
        guard let bird5 = Bird(birdName: "Carolina Chickadee", birdDescription: "Fun Fact: Young leave nest about 13-17 days after hatching", sighted: false, mainPhoto: CarolinaChickadeePhoto) else {
            fatalError("Unable to instantiate bird5")
        }
        guard let bird6 = Bird(birdName: "Cedar Waxing", birdDescription: "Fun Fact: The Cedar Waxwing is one of the few North American birds that specializes in eating fruit", sighted: false, mainPhoto: CedarWaxingPhoto) else {
            fatalError("Unable to instantiate bird6")
        }
        guard let bird7 = Bird(birdName: "Dark-eyed Junco", birdDescription: "Fun Fact: A recent estimate set the junco's total population at approximately 630 million individuals!!", sighted: false, mainPhoto: DarkEyedJuncoPhoto) else {
            fatalError("Unable to instantiate bird7")
        }
        guard let bird8 = Bird(birdName: "Downy Woodpecker", birdDescription: "Fun Fact: Special feathers around their nostrils keep them from breathing in wood chips", sighted: false, mainPhoto: DownyWoodpeckerPhoto) else {
            fatalError("Unable to instantiate bird8")
        }
        guard let bird9 = Bird(birdName: "Eared Grebe", birdDescription: "Fun Fact: The Eared Grebe migrates only at night", sighted: false, mainPhoto: EaredGrebePhoto) else {
            fatalError("Unable to instantiate bird9")
        }
        guard let bird10 = Bird(birdName: "House Finch", birdDescription: "Fun Fact: Females prefer to mate with the reddest male they can find, perhaps increasing the probability of obtaining a capable mate who can do his part in feeding the nestlings", sighted: false, mainPhoto: HouseFinchPhoto) else {
            fatalError("Unable to instantiate bird10")
        }
        guard let bird11 = Bird(birdName: "House Sparrow", birdDescription: "Fun Fact: On the ground, the house sparrow typically hops rather than walks", sighted: false, mainPhoto: HouseSparrowPhoto) else {
            fatalError("Unable to instantiate bird11")
        }
        guard let bird12 = Bird(birdName: "Mallard", birdDescription: "Fun Fact: The scientific name for the Mallard Duck is Anas Platyrhynchos", sighted: false, mainPhoto: MallardPhoto) else {
            fatalError("Unable to instantiate bird12")
        }
        guard let bird13 = Bird(birdName: "Mourning Dove", birdDescription: "Fun Fact: The cooooOOOOO-woo-woo-woo call is almost always uttered by the male bird, not the female, and is—wait for it—a wooing call, an enticement to a mate or potential mate", sighted: false, mainPhoto: MourningDovePhoto) else {
            fatalError("Unable to instantiate bird13")
        }
        guard let bird14 = Bird(birdName: "Northern Bobwhite", birdDescription: "un Fact: Northern bobwhites reach sexual maturity at the age of 1 year", sighted: false, mainPhoto: NorthernBobwhitePhoto) else {
            fatalError("Unable to instantiate bird14")
        }
        guard let bird15 = Bird(birdName: "Northern Cardinal", birdDescription: "Fun Fact: Unlike many other songbirds in North America, both the male and female cardinals can sing", sighted: false, mainPhoto: NorthernCardinalPhoto) else {
            fatalError("Unable to instantiate bird15")
        }
        guard let bird16 = Bird(birdName: "Northern Mockingbird", birdDescription: "Fun Fact: A male mockingbird can learn up to 200 different songs", sighted: false, mainPhoto: NorthernMockingbirdPhoto) else {
            fatalError("Unable to instantiate bird16")
        }
        guard let bird17 = Bird(birdName: "Purple Martin", birdDescription: "Fun Fact:  The Purple Martin is the largest swallow in North America", sighted: false, mainPhoto: PurpleMartinPhoto) else {
            fatalError("Unable to instantiate bird17")
        }
        guard let bird18 = Bird(birdName: "Red-tailed Hawk", birdDescription: "Fun Fact: The Red-tailed Hawk is one of the most widely distributed hawks in the Americas", sighted: false, mainPhoto: RedTailedHawkPhoto) else {
            fatalError("Unable to instantiate bird18")
        }
        guard let bird19 = Bird(birdName: "Red-winged Blackbird", birdDescription: "Fun Fact: Some birds may travel as far as 80 km (50 mi) between the roosting and feeding sites", sighted: false, mainPhoto: RedWingedBlackbirdPhoto) else {
            fatalError("Unable to instantiate bird19")
        }
        guard let bird20 = Bird(birdName: "Ruby-throated Hummingbird", birdDescription: "Fun Fact: Ruby-throated hummingbirds eat insects and nectar from many flowering plants. They are attracted to the color red", sighted: false, mainPhoto: RubyThroatedHummingbirdPhoto) else {
            fatalError("Unable to instantiate bird20")
        }
        guard let bird21 = Bird(birdName: "Scissor-tailed Flycatcher", birdDescription: "Fun Fact: A group of scissor-tailed flycatchers is known as zipper, snip or pinking.", sighted: false, mainPhoto: ScissorTailedFlycatcherPhoto) else {
            fatalError("Unable to instantiate bird21")
        }
        guard let bird22 = Bird(birdName: "Tufted Titmouse", birdDescription: "Fun Fact: There is no gender difference. Both the sexes look alike", sighted: false, mainPhoto: TuftedTitmousePhoto) else {
            fatalError("Unable to instantiate bird22")
        }
        
        birds += [bird1, bird2, bird3, bird4, bird5, bird6, bird7, bird8, bird9, bird10, bird11, bird12, bird13, bird14, bird15, bird16, bird17, bird18, bird19, bird20, bird21, bird22]
        
    }
    
    private func saveBirds() {
        
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(birds, toFile: Bird.ArchiveURL.path)
        /*
        let isSuccessfulSave = try! NSKeyedArchiver.archivedData(withRootObject: birds, requiringSecureCoding: false)
        
        do {
            try isSuccessfulSave.write(to: Bird.ArchiveURL)
            os_log("Birds successfully saved.", log: OSLog.default, type: .debug)
            print("saved")
        } catch {
            os_log("Failed to save birds...", log: OSLog.default, type: .error)
        }
        */
        if isSuccessfulSave {
            os_log("Birds successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save birds...", log: OSLog.default, type: .error)
        }
    }
    
    private func loadBirds() -> [Bird]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Bird.ArchiveURL.path) as? [Bird]
        //return NSKeyedUnarchiver.unarchivedObject(ofClasses: Bird, from: Bird.ArchiveURL.path)
        //return NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(Data(contentsOf: Bird.ArchiveURL)) as? Bird
        //guard let codedBird = try? Data(contentsOf: Bird.ArchiveURL) else { return nil }
        //let birdData = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(codedBird) as? [Bird]
        //return birdData
    }

    @IBOutlet var birdTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationItem.leftBarButtonItem = editButtonItem
        
        if let savedBirds = loadBirds() {
            birds += savedBirds
        } else {
            loadSampleBirds()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return birds.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: birdCellIdentifier, for: indexPath) as? BirdTableViewCell else {
            fatalError("The dequeued cell is not an instance of BirdTableViewCell.")
        }
        
        let bird = birds[indexPath.row]
        
        cell.birdTableImage.image = bird.mainPhoto
        cell.birdTableLabel.text = bird.birdName
        if bird.sighted {
            cell.birdSightedLabel.text = "✔︎"
        } else {
            cell.birdSightedLabel.text = " "
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            birds.remove(at: indexPath.row)
            saveBirds()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}

