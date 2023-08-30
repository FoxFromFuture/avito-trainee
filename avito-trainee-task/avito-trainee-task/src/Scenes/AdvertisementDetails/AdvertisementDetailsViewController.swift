//
//  AdvertisementDetailsViewController.swift
//  avito-trainee-task
//
//  Created by Никита Лисунов on 8/24/23.
//

import UIKit

final class AdvertisementDetailsViewController: UIViewController {
    
    // MARK: - Constansts
    private enum Constants {
        static let fatalError: String = "init(coder:) has not been implemented"
    }
    
    // MARK: - Private Properties
    private let interactor: AdvertisementDetailsBusinessLogic
    private let router: AdvertisementDetailsRoutingLogic
    private let scrollView = UIScrollView()
    private let scrollContentView = UIView()
    private let adImageView = URLImageView()
    private let titleLabel = UILabel()
    private let priceLabel = UILabel()
    private let locationLabel = UILabel()
    private let createdDateLabel = UILabel()
    private let descriptionTitleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let contactsLabel = UILabel()
    private let emailLabel = UILabel()
    private let phoneNumberLabel = UILabel()
    private let addressLabel = UILabel()
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
        router: AdvertisementDetailsRoutingLogic,
        interactor: AdvertisementDetailsBusinessLogic
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
        self.navigationController?.isNavigationBarHidden = false
        interactor.loadStart(Model.Start.Request())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        currentState = .loading
        interactor.loadAdvertisementDetails(Model.GetAdvertisementDetails.Request())
    }
    
    // MARK: - Configuration
    private func configureUI() {
        view.backgroundColor = .white
        configureNavigationBar()
        configureScrollView()
        configureScrollContentView()
        configureAdImageView()
        configurePriceLabel()
        configureTitleLabel()
        configureContactsLabel()
        configureEmailLabel()
        configurePhoneNumberLabel()
        configureLocationLabel()
        configureAddressLabel()
        configureDescriptionTitleLabel()
        configureDescriptionLabel()
        configureCreatedDateLabel()
        configureLoadingIndicator()
        configureLoadingFailureLabel()
        configureReloadButton()
    }
    
    private func configureNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .plain,
            target: self,
            action: #selector(goBack)
        )
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    private func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.isScrollEnabled = true
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.backgroundColor = .white
        scrollView.frame = view.bounds
        scrollView.pin(to: self.view, [.top: 0, .bottom: 0, .right: 0, .left: 0])
    }
    
    private func configureScrollContentView() {
        scrollView.addSubview(scrollContentView)
        scrollContentView.pin(to: scrollView, [.left: 0, .right: 0, .top: 0, .bottom: 0])
        scrollContentView.pinWidth(to: scrollView.widthAnchor)
        scrollContentView.backgroundColor = .white
    }
    
    private func configureAdImageView() {
        scrollContentView.addSubview(adImageView)
        adImageView.pin(to: scrollContentView, [.top: 0, .left: 0, .right: 0])
        adImageView.pinHeight(to: adImageView.widthAnchor)
        adImageView.contentMode = .scaleAspectFit
        adImageView.clipsToBounds = true
    }
    
    private func configurePriceLabel() {
        scrollContentView.addSubview(priceLabel)
        priceLabel.pinTop(to: self.adImageView.bottomAnchor, 15)
        priceLabel.pin(to: scrollContentView, [.right: 10, .left: 10])
        priceLabel.numberOfLines = 0
        priceLabel.textColor = .black
        priceLabel.font = .systemFont(ofSize: 28, weight: .bold)
    }
    
    private func configureTitleLabel() {
        scrollContentView.addSubview(titleLabel)
        titleLabel.pinTop(to: self.priceLabel.bottomAnchor, 5)
        titleLabel.pin(to: scrollContentView, [.right: 10, .left: 10])
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 20, weight: .regular)
    }
    
    private func configureContactsLabel() {
        scrollContentView.addSubview(contactsLabel)
        contactsLabel.pinTop(to: self.titleLabel.bottomAnchor, 30)
        contactsLabel.pin(to: scrollContentView, [.right: 10, .left: 10])
        contactsLabel.numberOfLines = 0
        contactsLabel.textColor = .black
        contactsLabel.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    private func configureEmailLabel() {
        scrollContentView.addSubview(emailLabel)
        emailLabel.pinTop(to: self.contactsLabel.bottomAnchor, 6)
        emailLabel.pin(to: scrollContentView, [.right: 10, .left: 10])
        emailLabel.numberOfLines = 0
        emailLabel.textColor = .black
        emailLabel.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    private func configurePhoneNumberLabel() {
        scrollContentView.addSubview(phoneNumberLabel)
        phoneNumberLabel.pinTop(to: self.emailLabel.bottomAnchor, 4)
        phoneNumberLabel.pin(to: scrollContentView, [.right: 10, .left: 10])
        phoneNumberLabel.numberOfLines = 0
        phoneNumberLabel.textColor = .black
        phoneNumberLabel.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    private func configureLocationLabel() {
        scrollContentView.addSubview(locationLabel)
        locationLabel.pinTop(to: self.phoneNumberLabel.bottomAnchor, 15)
        locationLabel.pin(to: scrollContentView, [.right: 10, .left: 10])
        locationLabel.numberOfLines = 0
        locationLabel.textColor = .black
        locationLabel.font = .systemFont(ofSize: 15, weight: .regular)
    }
    
    private func configureAddressLabel() {
        scrollContentView.addSubview(addressLabel)
        addressLabel.pinTop(to: self.locationLabel.bottomAnchor)
        addressLabel.pin(to: scrollContentView, [.right: 10, .left: 10])
        addressLabel.numberOfLines = 0
        addressLabel.textColor = .black
        addressLabel.font = .systemFont(ofSize: 15, weight: .regular)
    }
    
    private func configureDescriptionTitleLabel() {
        scrollContentView.addSubview(descriptionTitleLabel)
        descriptionTitleLabel.pinTop(to: self.addressLabel.bottomAnchor, 30)
        descriptionTitleLabel.pin(to: scrollContentView, [.right: 10, .left: 10])
        descriptionTitleLabel.numberOfLines = 0
        descriptionTitleLabel.textColor = .black
        descriptionTitleLabel.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    private func configureDescriptionLabel() {
        scrollContentView.addSubview(descriptionLabel)
        descriptionLabel.pinTop(to: self.descriptionTitleLabel.bottomAnchor, 6)
        descriptionLabel.pin(to: scrollContentView, [.right: 10, .left: 10])
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .black
        descriptionLabel.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    private func configureCreatedDateLabel() {
        scrollContentView.addSubview(createdDateLabel)
        createdDateLabel.pinTop(to: self.descriptionLabel.bottomAnchor, 30)
        createdDateLabel.pin(to: scrollContentView, [.right: 10, .left: 10, .bottom: 20])
        createdDateLabel.numberOfLines = 0
        createdDateLabel.textColor = .gray
        createdDateLabel.font = .systemFont(ofSize: 13, weight: .regular)
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
        interactor.loadAdvertisementDetails(Model.GetAdvertisementDetails.Request())
    }
    
    @objc
    public func goBack() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        interactor.loadAdvertisementListScene(Model.AdvertisementList.Request())
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
extension AdvertisementDetailsViewController: AdvertisementDetailsDisplayLogic {
    func displayStart(_ viewModel: Model.Start.ViewModel) {
        self.configureUI()
    }
    
    func displayAdvertisementDetails(_ viewModel: Model.GetAdvertisementDetails.ViewModel) {
        DispatchQueue.main.async { [weak self] in
            self?.priceLabel.text = viewModel.details.price ?? ""
            self?.titleLabel.text = viewModel.details.title ?? ""
            self?.contactsLabel.text = "Контакты"
            self?.emailLabel.text = viewModel.details.email ?? ""
            self?.phoneNumberLabel.text = viewModel.details.phone_number ?? ""
            self?.locationLabel.text = viewModel.details.location ?? ""
            self?.addressLabel.text = viewModel.details.address ?? ""
            self?.descriptionTitleLabel.text = "Описание"
            self?.descriptionLabel.text = viewModel.details.description ?? ""
            self?.createdDateLabel.text = viewModel.details.created_date ?? ""
            self?.adImageView.loadImageByURL(url: viewModel.details.image_url ?? "", placeholder: UIImage(systemName: "rectangle.on.rectangle.slash.fill") ?? UIImage())
            self?.currentState = .loaded
        }
    }
    
    func displayLoadingFailure(_ viewModel: Model.LoadingFailure.ViewModel) {
        DispatchQueue.main.async { [weak self] in
            self?.currentState = .error
        }
    }
    
    func displayAdvertisementListScene(_ viewModel: Model.AdvertisementList.ViewModel) {
        router.routeToAdvertisementListScene()
    }
}

// MARK: - UpdateUIForState
extension AdvertisementDetailsViewController {
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
