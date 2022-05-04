//
//  CityDetailViewController.swift
//  Assignment4
//
//  Created by Yusuke K on 2022-05-03.
//  Copyright © 2022 Derrick Park. All rights reserved.
//

import UIKit

class CityDetailViewController: UIViewController {
    var city: City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    private func setupLayout(){
        let sv = UIStackView(arrangedSubviews: [
            UIView(),
            createSubStackView(title: "Country", val: city.icon, isIcon:true),
            createSubStackView(title: "City", val: city.name, isIcon:false),
            createSubStackView(title: "Temperature", val: String(city.temp), isIcon:false),
            createSubStackView(title: "Summary", val: city.icon, isIcon:false),
            UIView(),
        ])
        
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .equalSpacing
        sv.spacing = 10
      
        view.addSubview(sv)
        
        NSLayoutConstraint.activate([
            sv.centerXAnchor.constraint(equalTo: view.centerXAnchor ),
            sv.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      ])
    }
    
    private func createSubStackView(title:String, val:String, isIcon: Bool) -> UIStackView {
        let titleV = createLabelView(val: title)
        let dataV = isIcon ? createIconView(val: val) : createLabelView(val: val)
        
        let sv = UIStackView(arrangedSubviews: [UIView(),titleV, dataV,UIView()])
        sv.axis = .vertical
        sv.distribution = .equalSpacing
        sv.spacing = 10
        
        return sv
    }
    
    private func createIconView(val: String) -> UIImageView {
        
        return UIImageView(image: UIImage(named: val))
    }
    
    private func createLabelView(val:String) -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.text = val
        
        return label
    }
}
