class RootViewController < UIViewController
  def viewDidLoad
    video = AVMediaTypeVideo
    AVCaptureDevice.requestAccessForMediaType(video, completionHandler:lambda do |granted|
      capture = AVCaptureSession.new
      self.view = PreviewView.new
      view.layer.session = capture
      device = AVCaptureDevice.defaultDeviceWithMediaType video
      input = AVCaptureDeviceInput.deviceInputWithDevice device, error:nil
      output = AVCaptureMetadataOutput.new
      capture.addInput input
      capture.addOutput output
      capture.startRunning
    end)
  end
end
