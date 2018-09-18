class RootViewController < UIViewController
  attr_accessor :output, :capture, :input

  def viewDidLoad
    AVCaptureDevice.requestAccessForMediaType(AVMediaTypeVideo, completionHandler:lambda { |granted|completionHandler granted })
  end

  def completionHandler granted
    self.capture = AVCaptureSession.new
    capture.beginConfiguration
    self.view = PreviewView.new
    view.layer.session = capture
    device = AVCaptureDevice.defaultDeviceWithMediaType AVMediaTypeVideo
    self.input = AVCaptureDeviceInput.deviceInputWithDevice device, error:nil
    self.output = AVCaptureMetadataOutput.new
    output.setMetadataObjectsDelegate self, queue:Dispatch::Queue.main.dispatch_object
    capture.addInput input
    capture.addOutput output
    output.metadataObjectTypes = [ AVMetadataObjectTypeQRCode ]
    capture.commitConfiguration
    capture.startRunning
  rescue => exception
    puts "Rescued exception"
    puts exception
    puts exception.name
    puts exception.reason
    puts exception.userInfo
  end

  def captureOutput output, didOutputMetadataObjects:objects, fromConnection:connection
    puts "didOutputMetadataObjects: #{ objects }"
    objects.each do |object|
      
    end
  end
end
