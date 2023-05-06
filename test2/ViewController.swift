//
//  ViewController.swift
//  test2
//
//  Created by Nikolay Volnikov on 06.05.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    lazy var button1: UIButton = {
        let button = UIButton(configuration: getConfiguration("first text"))
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(button1Action), for: .touchUpInside)
        return button
    }()

    lazy var button2: UIButton = {
        let button = UIButton(configuration: getConfiguration("second medium text"))
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(button1Action(button:)), for: .touchUpInside)

        return button
    }()

    lazy var button3: UIButton = {
        let button = UIButton(configuration: getConfiguration("Third"))
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(button3Action), for: .touchUpInside)

        return button
    }()

    override func viewDidLayoutSubviews() {
//        setContentEdgeInsets(button1)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        configureConstraints()
    }

    private func configureConstraints() {
        button1.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.centerX.equalToSuperview()
        }

        button2.snp.makeConstraints {
            $0.top.equalTo(button1.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }

        button3.snp.makeConstraints {
            $0.top.equalTo(button2.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
    }

    private func getConfiguration(_ text: String) -> UIButton.Configuration {
        var configuration = UIButton.Configuration.filled()
        configuration.title = text
        configuration.image = UIImage(systemName: "swift")
        configuration.imagePadding = 8
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        configuration.imagePlacement = .trailing

        return configuration
    }

    @objc func button1Action(button: UIButton) {
        UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.allowUserInteraction, .beginFromCurrentState], animations: {
            button.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        }, completion: { _ in
            UIView.animate(withDuration: 0.3) {
                button.transform = CGAffineTransform.identity
            }
        })
    }

    @objc func button3Action() {
        let navigationController = UINavigationController(rootViewController: ViewControler2())
        navigationController.modalPresentationStyle = .pageSheet
        self.present(navigationController, animated: true, completion: nil)
    }
}


class ViewControler2: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }
}
