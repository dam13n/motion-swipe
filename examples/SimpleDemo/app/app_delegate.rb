class AppDelegate < PM::Delegate
  include CDQ # Remove this if you aren't using CDQ

  status_bar true, animation: :fade

  def on_load(app, options)
    cdq.setup # Remove this if you aren't using CDQ
    open HomeScreen.new(nav_bar: true)
  end

  # Remove this if you are only supporting portrait
  def application(application, willChangeStatusBarOrientation: new_orientation, duration: duration)
    # Manually set RMQ's orientation before the device is actually oriented
    # So that we can do stuff like style views before the rotation begins
    device.orientation = new_orientation
  end
end
