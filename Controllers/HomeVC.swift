//
//  ViewController.swift
//  Quotes in History
//
//  Created by Samyak Pawar on 24/09/20.
//

import UIKit




class HomeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var surpriseMeBtn: UIButton!
    @IBOutlet weak var chooseLegend: UILabel!
    
    
    
    var personArryIndex = 0
    var surprisePerson : Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        surpriseMeBtn.layer.cornerRadius = 20
        surprisePerson = nil
        
    }
    
    @IBAction func surprise(_ sender: UIButton) {
        surprisePerson = AllLegendsData.personArry.randomElement()
        performSegue(withIdentifier: "home_to_legend", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let VC = segue.destination as? LegendVC
        if surprisePerson != nil {
            VC?.person = surprisePerson
        }else{
            VC?.person = AllLegendsData.personArry[personArryIndex]
        }
       
    }
    
    @IBAction func comeBack(thesegue : UIStoryboardSegue ) {
        viewDidLoad()
    }

}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AllLegendsData.personArry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let personCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PersonTVCell
        personCell.pic.image = AllLegendsData.personArry[indexPath.row].pic
        personCell.desc.text = AllLegendsData.personArry[indexPath.row].desc
        
        return personCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        personArryIndex = indexPath.row
        
        tableView.deselectRow(at: indexPath, animated: true)
       
        performSegue(withIdentifier: "home_to_legend", sender: self)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        chooseLegend.alpha = 0
    }
    
    
}

