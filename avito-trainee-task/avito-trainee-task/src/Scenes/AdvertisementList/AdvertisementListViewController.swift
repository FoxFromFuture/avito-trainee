//
//  AdvertisementListViewController.swift
//  avito-trainee-task
//
//  Created by Никита Лисунов on 8/24/23.
//

import UIKit

// MARK: - AdvertisementListViewController
final class AdvertisementListViewController: UIViewController {
    // MARK: - Constansts
    private enum Constants {
        static let fatalError: String = "init(coder:) has not been implemented"
    }
    
    // MARK: - Private Properties
    private let interactor: AdvertisementListBusinessLogic
    private let router: AdvertisementListRoutingLogic
    private let navigationBar = AdvertisementListNavigationBar()
    private let tabBar = TabBar()
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    private var ads: Model.Ads = Model.Ads(advertisements: [])
    private let loadingIndicator = UIActivityIndicatorView(style: .medium)
    private let loadingFailureLabel = UILabel()
    private let reloadButton = UIButton()
    private var currentState: ViewState = .loading {
        didSet {
            updateUIForState(currentState)
        }
    }
    
    // MARK: - LifeCycle
    init(
        router: AdvertisementListRoutingLogic,
        interactor: AdvertisementListBusinessLogic
    ) {
        self.router = router
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
        
    }
        
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalError)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.loadStart(Model.Start.Request())
        currentState = .loading
        interactor.loadAdvertisements(Model.GetAds.Request())
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - Configuration
    private func configureUI() {
        view.backgroundColor = .white
        configureNavigationBar()
        configureTabBar()
        configureCollectionView()
        configureLoadingIndicator()
        configureLoadingFailureLabel()
        configureReloadButton()
    }
    
    private func configureNavigationBar() {
        self.view.addSubview(navigationBar)
        navigationBar.pin(to: self.view, [.left: 0, .right: 0, .top: 0])
    }
    
    private func configureTabBar() {
        self.view.addSubview(tabBar)
        tabBar.pinBottom(to: self.view.bottomAnchor)
        tabBar.pin(to: self.view, [.left: 0, .right: 0])
    }
    
    private func configureCollectionView() {
        self.view.addSubview(collectionView)
        collectionView.pin(to: self.view, [.left: 15, .right: 15])
        collectionView.pinTop(to: navigationBar.bottomAnchor)
        collectionView.pinBottom(to: tabBar.topAnchor)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.register(AdvertisementCell.self, forCellWithReuseIdentifier: "AdvertisementCell")
    }
    
    private func configureLoadingIndicator() {
        self.view.addSubview(loadingIndicator)
        loadingIndicator.pinCenter(to: self.view)
        loadingIndicator.color = .gray
    }
    
    private func configureLoadingFailureLabel() {
        loadingFailureLabel.text = "Connection Error"
        loadingFailureLabel.font = .systemFont(ofSize: 18, weight: .bold)
        loadingFailureLabel.textColor = .black
    }
    
    private func configureReloadButton() {
        reloadButton.setTitle("Reload", for: .normal)
        reloadButton.setTitleColor(.systemBlue, for: .normal)
        reloadButton.setTitleColor(.gray, for: .highlighted)
        reloadButton.backgroundColor = UIColor.clear
        reloadButton.addTarget(self, action: #selector(reloadButtonPressed), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc
    public func reloadButtonPressed() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        loadingFailureLabel.removeFromSuperview()
        reloadButton.removeFromSuperview()
        currentState = .loading
        interactor.loadAdvertisements(Model.GetAds.Request())
    }
    
    private func showLoadingFailure() {
        view.addSubview(loadingFailureLabel)
        loadingFailureLabel.pinCenter(to: self.view.centerXAnchor)
        loadingFailureLabel.pinTop(to: self.view, self.view.frame.height / 2.0 - 15)
        
        view.addSubview(reloadButton)
        reloadButton.pinTop(to: self.view, self.view.frame.height / 2.0 + 15)
        reloadButton.pinCenter(to: self.view.centerXAnchor)
    }
}

// MARK: - DisplayLogic
extension AdvertisementListViewController: AdvertisementListDisplayLogic {
    func displayStart(_ viewModel: Model.Start.ViewModel) {
        self.configureUI()
    }
    
    func displayAds(_ viewModel: Model.GetAds.ViewModel) {
        DispatchQueue.main.async { [weak self] in
            self?.currentState = .loaded
        }
        self.ads = viewModel.ads
        self.reloadData()
    }
    
    func displayAdvertisementDetailsScene(_ viewModel: Model.AdvertisementDetailsScene.ViewModel) {
        router.routeToAdvertisementDetailsScene()
    }
    
    func displayLoadingFailure(_ viewModel: Model.LoadingFailure.ViewModel) {
        DispatchQueue.main.async { [weak self] in
            self?.currentState = .error
        }
    }
}

// MARK: - CollectionView
extension AdvertisementListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ads.advertisements?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdvertisementCell", for: indexPath) as? AdvertisementCell else {
            return UICollectionViewCell()
        }
        cell.configure(
            imageURL: ads.advertisements?[indexPath.row].image_url ?? "",
            title: ads.advertisements?[indexPath.row].title ?? "",
            price: ads.advertisements?[indexPath.row].price ?? "",
            location: ads.advertisements?[indexPath.row].location ?? "",
            createdDate: ads.advertisements?[indexPath.row].created_date ?? ""
        )
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2 - 20, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        interactor.loadAdvertisementDetailsScene(Model.AdvertisementDetailsScene.Request(id: ads.advertisements?[indexPath.row].id))
    }
    
    private func reloadData() {
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

// MARK: - UpdateUIForState
extension AdvertisementListViewController {
    func updateUIForState(_ state: ViewState) {
        switch state {
        case .loading:
            loadingIndicator.startAnimating()
        case .loaded:
            loadingIndicator.stopAnimating()
        case .error:
            loadingIndicator.stopAnimating()
            showLoadingFailure()
        }
    }
}
