// Copyright © 2016-2017 Shawn Baker using the MIT License.
import UIKit

class AboutViewController: UIViewController
{
    // outlets
	@IBOutlet weak var navigationBar: UINavigationBar!
	@IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var infoTextView: UITextView!

    //**********************************************************************
    // viewDidLoad
    //**********************************************************************
    override func viewDidLoad()
    {
        super.viewDidLoad()
		
		let navigationItem = UINavigationItem()
		navigationItem.title = "appName".local
		navigationBar.items = [navigationItem]
		
        appNameLabel.text = "appName".local
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String,
			let buildStr = Bundle.main.infoDictionary?["CFBundleVersion"] as? String,
			let build = Int(buildStr)
        {
			let format = (build > 1) ? "versionBuild" : "version"
            versionLabel.text = String(format: format.local, version, buildStr)
        }
        infoTextView.attributedText = "aboutInfo".local.htmlAttr
    }
	
	//**********************************************************************
	// viewDidLayoutSubviews
	//**********************************************************************
	override func viewDidLayoutSubviews()
	{
		infoTextView.contentOffset = CGPoint.zero
		super.viewDidLayoutSubviews()
	}
}
