//
//  GlossaryViewController.swift
//  PCSA
//
//  Created by Jacqueline Bronger on 14/01/17.
//  Copyright © 2017 Peacecorps. All rights reserved.
//

import Foundation

class GlossaryViewController: MainViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchBarDelegate {
    
    
    @IBOutlet weak var glossaryTable: UITableView!
    let cellID = "Glossary_Cell"
    var selectedIndexPath: IndexPath?
    
    let allItems: [[String]] = [
        ["Aggravated Sexual Assault","Another person, without the consent of the Volunteer, intentionally or knowingly: \n• touches or contacts, either directly or through clothing, the Volunteer’s genitalia, anus, groin, breast, inner thigh, or buttocks; OR \n• kisses the Volunteer; \n• OR disrobes the Volunteer; OR\n• causes the Volunteer to touch or contact, either directly or through clothing, another person’s genitalia, anus, groin, breast, inner thigh, or buttocks, OR\n• attempts to carry out any of those acts, AND: \n• The offender uses, or threatens to use, a weapon, OR\n• The offender uses, or threatens to use, force or other intimidating actions, OR\n• The Volunteer is incapacitated or otherwise incapable of giving consent."],
        ["Assailant" , "A person who attacks another or a person who commits a crime."],
        ["Burglary", "Unlawful or forcible entry of a residence. This incident type usually, but not always, involves theft. The illegal entry may be forcible, such as breaking a window or slashing a screen, or may be without force by entering through an unlocked door or an open window. As long as the person entering has no legal right to be present in the residence, a burglary has occurred. Also includes illegal entry of a hotel room.\n\nWhat is a burglary?\nA burglary occurs anytime there is unlawful or unauthorized entry or attempted into your house, room or hotel room. Unlawful entry does not have to involve force or someone breaking in; unlawful entry occurs anytime someone who does not have permission enters your house or hotel room. Unlawful entry can occur through a window or door that is not locked or through a window or door that has been left open."],
        ["Bystander intervention", "The process of safely interrupting a situation in which others may be at risk for becoming the victim of sexual or physical violence."],
        ["Bystander phenomenon", "A social-psychological phenomenon in which individuals do not offer help to someone in danger when other people are present."],
        ["Cyber Stalking", "The repeated use of electronic communications to harass or frighten someone, for example by sending threatening e-mails"],
        ["Danger", "A condition with the potential to cause illness, injury, death, property damage or loss."],
        ["Mitigation", "Steps taken to reduce risk by reducing the likelihood that a dangerous event will occur or the impact if it does occur."],
        ["PII", "“Personally Identifying Information” or “PII” means individually identifying information for or about a Volunteer who is a victim of sexual assault, including first and last name, home or physical address (including site location), contact information (such as postal address, email, IP address, telephone or fax number), social security number, date of birth, ethnicity, race, religious affiliation, the location of the incident, the victim’s sector, entry on service date, close of service date or time since swearing-in and any other information that, either individually or in combination with other information, would serve to identify the Volunteer or is likely to disclose the location of the Volunteer."],
        ["Rape", "The penetration, no matter how slight, of the vagina or anus with any body part or object, or oral penetration by a sex organ of another person, without the consent of the Volunteer."],
        ["Risk", "The probability that a dangerous event will actually occur and the impact if it does."],
        ["Robbery", "The taking or attempting to take anything of value under confrontational circumstances from the control, custody or care of the victim by force or threat of force or violence and/or by putting the victim in fear of immediate harm. Also includes when a robber displays/uses a weapon or transports the victim to obtain his/her money or possessions.\n\nWhat is a robbery?\nA robbery always involves taking or attempting to take property through the use of force or the threat of force. A robbery can involve the use of a weapon or just the use of the suspect’s hands or feet. If a suspect threatens to harm you unless you surrenders your property, that is also robbery. If you are injured while someone is taking your property by force, the incident is reported as a robbery."],
        ["Safety", "Steps taken to protect against accidents and natural dangers (as opposed to man-made dangers)"],
        ["Security", "Protection against man-made dangers"],
        ["Sexual Assault", "Another person, without the consent of the Volunteer, intentionally or knowingly:\n• touches or contacts, either directly or through clothing, the Volunteer’s genitalia, anus, groin,breast, inner thigh, or buttocks; OR\n• kisses the Volunteer on the mouth; OR\n• attempts to carry out any of those acts. "],
        ["Sexual Exploitation", "Sexual exploitation means taking sexual advantage of another person without consent, including, but not limited to, (i) causing someone to become incapacitated to gain sexual advantage, (ii) causing the prostitution of another person, (iii) recording, photographing or transmitting images of sexual activity or the intimate parts of another person, (iv) allowing third parties to observe private sexual acts, (v) engaging in voyeurism, or (vi) knowingly or recklessly exposing another person to a significant risk of sexually transmitted infection, including HIV."],
        ["Sexual Harassment", "Offensive conduct of a sexual nature that relates to sex, sexual orientation, gender identity or gender expression of a Volunteer/ Trainee by a Peace Corps staff member or another Volunteer/ Trainee."],
        ["Sexual Misconduct", "Non-consensual sexual activity, non-consensual sexual contact, sexual exploitation, sexual harassment or stalking of a Volunteer/ Trainee against another Volunteer/ Trainee.  Sexual Misconduct in the context of this session relates to the handling of complaints of sexual misconduct of a Volunteer/ Trainee against another Volunteer/ Trainee under Peace Corps’ Sexual Misconduct Policy which allows for handling of such cases through an internal administrative process."],
        ["Sexual Predator", "A person who commits a sexually violent offense and especially one who is likely to commit more sexual offenses."],
        ["Threat", "A dangerous event, person or thing."],
        ["Stalking", "Repeated threatening behavior from a single person that causes a Volunteer to fear for his or her safety or suffer substantial emotional distress."],
        ["Theft", "The taking away of or attempt to take away property or cash without involving force or illegal entry. Includes pick pocketing, stolen purses, and theft from a residence that does not involve an illegal entry.\n\nWhat is a theft?\nA theft occurs when property is stolen without a direct confrontation with the suspect and when there has not been illegal entry into the residence (including hotel room). For example, if you give someone permission to enter your house and that person steals your property, it is a theft. It is also a theft if your purse, cell phone, backpack or similar property is “snatched” away by a suspect or are not assaulted in any other way."],
        ["Vulnerability", "The susceptibility of a person, object or place to a danger or dangers."]
    ]
    var filteredItems: [[String]] = [[]]
    var searchController: UISearchController!
    var showSearchResults = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredItems = allItems
        showSearchResults = false
        
        configureSearchController()
    }
    
    func configureSearchController(){
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        glossaryTable.tableHeaderView = searchController.searchBar
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if showSearchResults {
            return filteredItems.count
        } else {
            return allItems.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! GlossaryTableViewCell
        
        if showSearchResults {
            cell.entryTitle.text = filteredItems[indexPath.row][0]
            cell.entryExplanation.text = filteredItems[indexPath.row][1]
        } else {
            cell.entryTitle.text = allItems[indexPath.row][0]
            cell.entryExplanation.text = allItems[indexPath.row][1]
        }
        
        cell.checkExpanded()
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let prevIndexPath = selectedIndexPath
        if indexPath == selectedIndexPath {
            selectedIndexPath = nil
        } else {
            selectedIndexPath = indexPath
        }
        var indexPaths: Array<IndexPath> = []
        if let prev = prevIndexPath {
            indexPaths += [prev]
        }
        if let current = selectedIndexPath {
            indexPaths += [current]
        }
        
        if indexPaths.count > 0 {
            tableView.reloadRows(at: indexPaths, with: .automatic)
        }
        
        if let prev = prevIndexPath {
            (tableView.cellForRow(at: prev) as? GlossaryTableViewCell)?.checkExpanded()
        }
        if let current = selectedIndexPath {
            (tableView.cellForRow(at: current) as? GlossaryTableViewCell)?.checkExpanded()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == selectedIndexPath {
            return UITableViewAutomaticDimension
        } else {
            return GlossaryTableViewCell.collapsedHeight
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return GlossaryTableViewCell.approxExpandedHeight
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        showSearchResults = true
        glossaryTable.reloadData()
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        showSearchResults = false
        glossaryTable.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        showSearchResults = true
        glossaryTable.reloadData()
        searchController.searchBar.resignFirstResponder()
    }
    
    func updateSearchResults(for: UISearchController) {
        let searchString = searchController.searchBar.text
        
        // filter so that only glossary entries are displayed that contain the search string somewhere in the title
        filteredItems = allItems.filter({ (glossaryEntry) -> Bool in
            let entryHeader: NSString = glossaryEntry[0] as NSString
            return (entryHeader.range(of: searchString!, options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
        })
        
        glossaryTable.reloadData()
    }

}
