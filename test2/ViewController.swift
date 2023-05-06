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
        button.addTarget(self, action: #selector(animateDown), for: [.touchDown, .touchDragEnter])
        button.addTarget(self, action: #selector(animateUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
        return button
    }()

    lazy var button2: UIButton = {
        let button = UIButton(configuration: getConfiguration("second medium text"))
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(animateDown), for: [.touchDown, .touchDragEnter])
        button.addTarget(self, action: #selector(animateUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
        return button
    }()

    lazy var button3: UIButton = {
        let button = UIButton(configuration: getConfiguration("Third"))
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(button3Action), for: .touchUpInside)
        button.addTarget(self, action: #selector(animateDown), for: [.touchDown, .touchDragEnter])
        button.addTarget(self, action: #selector(animateUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
        return button
    }()

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
            $0.height.equalTo(35)
        }

        button2.snp.makeConstraints {
            $0.top.equalTo(button1.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(35)
        }

        button3.snp.makeConstraints {
            $0.top.equalTo(button2.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(35)
        }
    }

    private func getConfiguration(_ text: String) -> UIButton.Configuration {
        var configuration = UIButton.Configuration.filled()
        configuration.title = text
        configuration.image = UIImage(systemName: "arrow.right.circle.fill")
        configuration.imagePadding = 8
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        configuration.imagePlacement = .trailing

        return configuration
    }

    private func animate(_ button: UIButton, transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 3,
                       options: [.curveEaseInOut],
                       animations: {
                        button.transform = transform
            }, completion: nil)
    }

    @objc func button3Action() {
        let navigationController = UINavigationController(rootViewController: ViewControler2())
        navigationController.modalPresentationStyle = .pageSheet
        self.present(navigationController, animated: true, completion: nil)
    }

    @objc private func animateDown(sender: UIButton) {
        animate(sender, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
    }

    @objc private func animateUp(sender: UIButton) {
        animate(sender, transform: .identity)
    }
}


class ViewControler2: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }
}
