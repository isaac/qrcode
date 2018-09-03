class RootViewController < UIViewController
  def viewDidLoad
    AVCaptureDevice.requestAccessForMediaType(AVMediaTypeMetadataObject, completionHandler:lambda do |granted|
      puts granted
    end)
  end
end
